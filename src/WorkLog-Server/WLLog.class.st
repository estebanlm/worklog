"
I'm a log event. 
I have a moment (date), and a message.

logs are the fundamental element of worklog application. 
they keep a unit of log  who is basically the purpose of all this :)

In the future, I can have also an user references (in case I want to create multiuser logs)

Of course, I'm a toot class and I have many queries that can be done (see my class side  methods)
"
Class {
	#name : #WLLog,
	#superclass : #Object,
	#instVars : [
		'permaLink',
		'date',
		'text',
		'parsedText',
		'referencedLinks'
	],
	#category : 'WorkLog-Server-Model'
}

{ #category : #accessing }
WLLog class >> findByPermaLink: aNumber [
	^ self selectOne: [ :each | each permaLink = aNumber ]
]

{ #category : #accessing }
WLLog class >> findDay [
	| day nextDay |
	day := Date today asDateAndTime.
	nextDay := (Date today + 1 day) asDateAndTime.
	^ self sortLogs: (self selectMany: [ :each | (each date >= day) & (each date < nextDay) ])
]

{ #category : #accessing }
WLLog class >> findFrom: fromDate to: toDate [ 
	^ self sortLogs: (self selectMany: [ :each | (each date >= fromDate) & (each date <= toDate) ])
]

{ #category : #accessing }
WLLog class >> findLastWeek [
	| startDay endDay |
	endDay := Week current asDate.
	startDay := endDay - 7 days.
	^ self sortLogs: (self selectMany: [ :each | (each date > startDay) & (each date <= endDay) ])
]

{ #category : #accessing }
WLLog class >> findMonth [
	| day |
	day := Date today asMonth asDate.
	^ self sortLogs: (self selectMany: [ :each | each date >= day ])
]

{ #category : #accessing }
WLLog class >> findWeek [
	| day |
	day := Week current asDate.
	"Week starts in sunday and I want it on monday so I check for bigger and not bigger and equals"
	^ self sortLogs: (self selectMany: [ :each | each date > day ])
]

{ #category : #testing }
WLLog class >> isVoyageRoot [ 
	^ true
]

{ #category : #persistence }
WLLog class >> mongoParsedText [
	<mongoDescription>
	
	^ VOTransientDescription new 
		attributeName: 'parsedText';
		yourself
]

{ #category : #private }
WLLog class >> sortLogs: aCollection [
	^ aCollection sorted: [ :a :b | b date < a date ]
]

{ #category : #'instance creation' }
WLLog class >> text: aString [ 
	^ self new 
		text: aString;
		yourself
]

{ #category : #accessing }
WLLog >> date [
	^ date
]

{ #category : #accessing }
WLLog >> date: anObject [
	date := anObject
]

{ #category : #accessing }
WLLog >> dateAsHuman [
	^ self date asHuman
]

{ #category : #private }
WLLog >> generatePermaLink [
	permaLink := WLSequence nextPermaLinkNumber.

]

{ #category : #private }
WLLog >> generateReferencedLinks [
	| objects |
	
	objects := WLReferenceCollector new
		visit: self parsedText;
		objects.
	objects ifEmpty: [ ^ self ].
	referencedLinks := objects collect: #asReferencedObject.  

]

{ #category : #initialization }
WLLog >> initialize [
	super initialize.
	date := DateAndTime now.
	
]

{ #category : #printing }
WLLog >> jsonOn: stream [ 
	^ Dictionary new 
		at: 'permaLink' put: self permaLink;
		at: 'date' put: self dateAsHuman;
		at: 'text' put: (PRTextWriter write: self parsedText);
		at: 'asciiDoc' put: (WLAsciiDocWriter write: self parsedText);
		stonOn: stream
]

{ #category : #accessing }
WLLog >> parsedText [
	^ parsedText ifNil: [ parsedText := PRDocument parser parse: self text ]
]

{ #category : #accessing }
WLLog >> permaLink [
	^ permaLink
]

{ #category : #printing }
WLLog >> printOn: stream [ 
	stream 
		<< (self permaLink ifNil: [ 'NO_PERMALINK_YET' ]) << ': '
		<< self dateAsHuman
]

{ #category : #accessing }
WLLog >> referencedLinks [
	^ referencedLinks

]

{ #category : #persistence }
WLLog >> save [
	self isNew  ifTrue: [ 
		self permaLink ifNil: [ self generatePermaLink ].
		self generateReferencedLinks. ].
	super save.
	

]

{ #category : #printing }
WLLog >> stonOn: stonWriter [
	stonWriter isJsonMode ifTrue: [ ^ self jsonOn: stonWriter ].
	^ super stonOn: stonWriter
		 
]

{ #category : #accessing }
WLLog >> text [
	^ text
]

{ #category : #accessing }
WLLog >> text: anObject [
	text := anObject.
	parsedText := nil.
	referencedLinks := nil.
]

{ #category : #accessing }
WLLog >> textAsHTML [
	^ [ PRHTMLWriter write: self parsedText ]
		on: PRError do: [ :e | self text ].
]
