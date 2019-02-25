Class {
	#name : #WLAsciiDocChangeLogBuilder,
	#superclass : #Object,
	#instVars : [
		'rawLogs'
	],
	#category : 'WorkLog-Client-Model'
}

{ #category : #'instance creation' }
WLAsciiDocChangeLogBuilder class >> new [
	self error: 'Use #rawLog:'
]

{ #category : #'instance creation' }
WLAsciiDocChangeLogBuilder class >> rawLogs: aCollection [
	^ self basicNew 
		initializeRawLogs: aCollection;
		yourself
]

{ #category : #initialization }
WLAsciiDocChangeLogBuilder >> initializeRawLogs: aCollection [
	self initialize.
	rawLogs := aCollection.
]

{ #category : #private }
WLAsciiDocChangeLogBuilder >> logToChangeLog: postDictionary [
	^ String streamContents: [ :stream | | cr lines |
		cr := OSPlatform current lineEnding. 
		lines := (postDictionary at: 'asciiDoc') lines.
		stream << '*    ' << lines first << cr.
		lines allButFirst
			do: [ :each | stream << '    ' << each  ]
			separatedBy: [ stream << cr ] ]
		
]

{ #category : #accessing }
WLAsciiDocChangeLogBuilder >> rawLogs [
	^ rawLogs
]

{ #category : #enumerating }
WLAsciiDocChangeLogBuilder >> withChangeLogDo: aBlock [
	self rawLogs 
		do: [ :each | aBlock value: (self logToChangeLog: each) ]
]

{ #category : #enumerating }
WLAsciiDocChangeLogBuilder >> withChangeLogDo: aBlock separatedBy: separationBlock [
	^ self rawLogs 
		do: [ :each | aBlock value: (self logToChangeLog: each) ]
		separatedBy: separationBlock
]

{ #category : #enumerating }
WLAsciiDocChangeLogBuilder >> withDateDo: dateBlock withChangeLogDo: logBlock separatedBy: separationBlock [
	^ self 
		withDateDo: dateBlock 
		withChangeLogDo: logBlock 
		separatedBy: separationBlock
		dateSeparatedBy: separationBlock
]

{ #category : #enumerating }
WLAsciiDocChangeLogBuilder >> withDateDo: dateBlock withChangeLogDo: logBlock separatedBy: separationBlock dateSeparatedBy: dateSeparationBlock [
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
