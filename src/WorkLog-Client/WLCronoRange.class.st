Class {
	#name : #WLCronoRange,
	#superclass : #Object,
	#instVars : [
		'fromDate',
		'toDate'
	],
	#category : #'WorkLog-Client-Model'
}

{ #category : #'instance creation' }
WLCronoRange class >> fromString: aString [

	aString isEmptyOrNil ifTrue: [ ^ self newFrom: Date today ].
	aString first = $~ ifFalse: [ self error: 'Invalid range specifications' ].	

	^ self 
		newFrom: (Date today - ((aString allButFirst asNumber - 1) days)) asDate 
		to: Date today
]

{ #category : #'instance creation' }
WLCronoRange class >> newFrom: aDate [

	^ self newFrom: aDate to: aDate
]

{ #category : #'instance creation' }
WLCronoRange class >> newFrom: fromDate to: toDate [

	^ self basicNew 
		initializeFrom: fromDate to: toDate;
		yourself
]

{ #category : #enumerating }
WLCronoRange >> days [
	| days |
	
	days := OrderedCollection new.
	self daysDo: [ :each | days add: each ].
	^ days
	
]

{ #category : #enumerating }
WLCronoRange >> daysDo: aBlock [
	| day |
	
	day := fromDate.
	[ day <= toDate ] whileTrue: [ 
		aBlock value: day.
		day := (day + 1 day) asDate ]
]

{ #category : #initialization }
WLCronoRange >> initializeFrom: aDate to: otherDate [

	self initialize.
	fromDate := aDate.
	toDate := otherDate
]
