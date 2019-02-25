Class {
	#name : #WLChangeLogBuilder,
	#superclass : #Object,
	#instVars : [
		'rawLogs'
	],
	#category : 'WorkLog-Client-Model'
}

{ #category : #'instance creation' }
WLChangeLogBuilder class >> new [
	self error: 'Use #rawLog:'
]

{ #category : #'instance creation' }
WLChangeLogBuilder class >> rawLogs: aCollection [
	^ self basicNew 
		initializeRawLogs: aCollection;
		yourself
]

{ #category : #initialization }
WLChangeLogBuilder >> initializeRawLogs: aCollection [
	self initialize.
	rawLogs := aCollection.
]

{ #category : #private }
WLChangeLogBuilder >> logToChangeLog: postDictionary [
	| lines |
	lines := ((String streamContents: [ :stream | 
		(postDictionary at: 'text') linesDo: [ :each | 
			each trimBoth ifNotEmpty: [ stream << each; cr ] ] ])
			withNoLineLongerThan: 80)
			lines.
	^ String streamContents: [ :stream | 
			stream << '  * ' << lines first; cr.
			lines allButFirst
				do: [ :each | stream << '    ' << each ]
				separatedBy: [ stream cr ]]
]

{ #category : #accessing }
WLChangeLogBuilder >> rawLogs [
	^ rawLogs
]

{ #category : #enumerating }
WLChangeLogBuilder >> withChangeLogDo: aBlock [
	self rawLogs 
		do: [ :each | aBlock value: (self logToChangeLog: each) ]
]

{ #category : #enumerating }
WLChangeLogBuilder >> withChangeLogDo: aBlock separatedBy: separationBlock [
	^ self rawLogs 
		do: [ :each | aBlock value: (self logToChangeLog: each) ]
		separatedBy: separationBlock
]

{ #category : #enumerating }
WLChangeLogBuilder >> withDateDo: dateBlock withChangeLogDo: logBlock separatedBy: separationBlock [
	^ self 
		withDateDo: dateBlock 
		withChangeLogDo: logBlock 
		separatedBy: separationBlock
		dateSeparatedBy: separationBlock
]

{ #category : #enumerating }
WLChangeLogBuilder >> withDateDo: dateBlock withChangeLogDo: logBlock separatedBy: separationBlock dateSeparatedBy: dateSeparationBlock [
	| logsByDate |
	logsByDate := self rawLogs groupedBy: [ :each | (each at: 'date') asDate ].
	(logsByDate associations sorted: [ :a :b | a key > b key ])
		do: [ :eachAssoc | | date logs |
			date := eachAssoc key. 
			logs := eachAssoc value. 
			dateBlock value: date.
			logs 
				do: [ :each | logBlock value: (self logToChangeLog: each) ]
				separatedBy: separationBlock ]
		separatedBy: dateSeparationBlock
]
