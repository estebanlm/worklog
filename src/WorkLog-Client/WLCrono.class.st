"
I'm a small tool to keep a daily log. 
I don't know if I will be useful, but Esteban sometimes wants to keep track of all stupid actions he do, without needing to publish them each time (ideally, he will be publishing a digest of this, using WorkLog ).

So far, I just know ==#log:==, which appends an entry to the daily log.

"
Class {
	#name : #WLCrono,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'WorkLog-Client-Model'
}

{ #category : #'instance creation' }
WLCrono class >> new [
	self error: 'Use #uniqueInstance'
]

{ #category : #'instance creation' }
WLCrono class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := super new ]
]

{ #category : #accessing }
WLCrono >> baseDirReference [
	^ WLCronoConfiguration readFromFileSystem baseDirReference
		ensureCreateDirectory;
		yourself
	
]

{ #category : #logging }
WLCrono >> log: aString [
	| lineEnding |
	lineEnding := OSPlatform current lineEnding.
	self todayReference writeStreamDo: [ :stream |
		stream setToEnd.
		stream
			<< '# At ' << Time now logPrintTime << lineEnding
			<< aString << lineEnding ]
]

{ #category : #accessing }
WLCrono >> referenceOfDay: aDate [
	^ (self baseDirReference / aDate yyyymmdd) withExtension: 'md' 
]

{ #category : #accessing }
WLCrono >> review [
	^ self todayReference readStreamDo: [ :stream | stream contents ].
	
]

{ #category : #accessing }
WLCrono >> todayReference [
	^ self referenceOfDay: Date today
]
