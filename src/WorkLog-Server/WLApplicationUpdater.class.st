Class {
	#name : #WLApplicationUpdater,
	#superclass : #Object,
	#instVars : [
		'status',
		'lastUpdateDate',
		'lastErrorMessage'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'WorkLog-Server-Model'
}

{ #category : #'instance creation' }
WLApplicationUpdater class >> new [
	self error: 'Use #uniqueInstance'
]

{ #category : #'instance creation' }
WLApplicationUpdater class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := super new ]
]

{ #category : #private }
WLApplicationUpdater >> basicUpdate [
	self status: #updating.
	self lastErrorMessage: nil.
	[ self prepareLoad.
	  self loadBaseline.
	  Smalltalk saveSession ]
	on: Error do: [ :e | 
		self lastErrorMessage: e messageText.
		^ self status: #error ].
	self lastUpdateDate: DateAndTime now.
	self status: #ok
]

{ #category : #initialization }
WLApplicationUpdater >> initialize [
	super initialize.
	self status: #ok
]

{ #category : #testing }
WLApplicationUpdater >> isError [
	^ status = #error
]

{ #category : #testing }
WLApplicationUpdater >> isOk [
	^ status = #ok
]

{ #category : #testing }
WLApplicationUpdater >> isUpdating [
	^ status = #updating
]

{ #category : #accessing }
WLApplicationUpdater >> lastErrorMessage [
	^ lastErrorMessage
]

{ #category : #private }
WLApplicationUpdater >> lastErrorMessage: aString [
	lastErrorMessage := aString
]

{ #category : #accessing }
WLApplicationUpdater >> lastUpdateDate [
	^ lastUpdateDate
]

{ #category : #private }
WLApplicationUpdater >> lastUpdateDate: anObject [
	lastUpdateDate := anObject
]

{ #category : #private }
WLApplicationUpdater >> loadBaseline [
	Metacello new 
		githubUser: 'estebanlm' project: 'worklog' commitish: 'master' path: 'mc';
		baseline: 'WorkLog';
		silently;
		ignoreImage;
		onLock: [ :e | e allow ];
		onUpgrade: [ :e | e allow ];
		onConflict: [ :e | e allow ];
		load: 'server'.
]

{ #category : #private }
WLApplicationUpdater >> prepareLoad [
	"Ensure I can load WorkLog-Server"
	(RPackageOrganizer default packageNamed: 'WorkLog-Server') 
		mcWorkingCopy 
		modified: false.	

]

{ #category : #accessing }
WLApplicationUpdater >> status [
	^ status
]

{ #category : #accessing }
WLApplicationUpdater >> status: aSymbol [
	"#updating/#ok/#error (if #error then lastErrorMessage can have some information)"
	status := aSymbol
]

{ #category : #updating }
WLApplicationUpdater >> update [
	[ self basicUpdate ] fork
]
