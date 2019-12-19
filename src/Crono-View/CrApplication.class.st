"
I am the Crono application
"
Class {
	#name : #CrApplication,
	#superclass : #SpApplication,
	#instVars : [
		'standalone',
		'repository',
		'notificationCenter'
	],
	#classVars : [
		'Current',
		'Development'
	],
	#classInstVars : [
		'session'
	],
	#category : #'Crono-View-Application'
}

{ #category : #accessing }
CrApplication class >> applicationName [

	^ 'crono'
]

{ #category : #accessing }
CrApplication class >> beDevelopment [
	<script>

	Development := true
]

{ #category : #accessing }
CrApplication class >> beProduction [
	<script>

	Development := false
]

{ #category : #'instance creation' }
CrApplication class >> current [

	self validateSession.
	^ Current ifNil: [ Current := self new ]
]

{ #category : #'class initialization' }
CrApplication class >> initialize [

	self beDevelopment
]

{ #category : #testing }
CrApplication class >> isDevelopment [

	^ Development
]

{ #category : #'world menu' }
CrApplication class >> menuCommandOn: aBuilder [
	<worldMenu>

	(aBuilder item: #Crono)
		order: 1000.0;
		target: self;
		parent: #Tools;
		with: [ 
			(aBuilder item: #'crono add entry')
				target: CrCronoDialog;
				selector: #openDialog;
				order: 10. 
			(aBuilder item: #'crono review logs')
				target: CrReviewWindow;
				selector: #open;
				order: 20.
			(aBuilder item: #'crono todo')
				target: CrTodoWindow;
				selector: #open;
				order: 30 ]
]

{ #category : #accessing }
CrApplication class >> reset [
	<script>

	Current ifNotNil: [ Current emergencyShutdown ].
	Current := nil
]

{ #category : #private }
CrApplication class >> validateSession [
	
	session == Smalltalk session ifTrue: [ ^ self ].
	Current := nil.
	session := Smalltalk session
]

{ #category : #initialization }
CrApplication >> emergencyShutdown [

	repository close.
	CrTodoList focus resetCache
]

{ #category : #accessing }
CrApplication >> iconNamed: aSymbol [

	aSymbol ifNil: [ ^ nil ].
	^ self iconProvider iconNamed: aSymbol
]

{ #category : #accessing }
CrApplication >> iconProvider [

	^ self configuration iconProvider
]

{ #category : #initialization }
CrApplication >> initialize [

	standalone := false.
	super initialize.
	self initializeBackend.
	self initializeRepository.
	self initializeVirtualLists
]

{ #category : #initialization }
CrApplication >> initializeBackend [
	
	self settings isDarkTheme
		ifTrue: [ self useGtkDark ]
		ifFalse: [ self useGtk ]
]

{ #category : #initialization }
CrApplication >> initializeRepository [
	| reference isNew |

	reference := FileLocator imageDirectory / 'crono.db'.
	isNew := reference exists not.
	repository := VOUnQLiteRepository on: reference.
	isNew ifTrue: [ 
		CrTodoList newBaseLists 
			do: [ :each | repository save: each ] ]
]

{ #category : #initialization }
CrApplication >> initializeVirtualLists [

	CrVirtualList allLists do: [ :each | 
		each onApplicationStart: self ]
]

{ #category : #testing }
CrApplication >> isStandalone [

	^ standalone
]

{ #category : #accessing }
CrApplication >> notificationCenter [

	^ notificationCenter ifNil: [ 
		notificationCenter := CrNotificationCenter new ]
]

{ #category : #initialization }
CrApplication >> prepareAsStandaloneApplication [
	
	standalone := true
]

{ #category : #accessing }
CrApplication >> repository [ 

	^ repository
]

{ #category : #running }
CrApplication >> run [

	Current := self.
	super run	
]

{ #category : #accessing }
CrApplication >> settings [ 

	^ CrApplicationConfiguration readFromFileSystem
]

{ #category : #running }
CrApplication >> start [

	self isStandalone ifFalse: [ ^ self ].

	CrApplicationStarter new 
		application: self;
		start
]

{ #category : #initialization }
CrApplication >> useGtk [
	
	self 
		useBackend: #Gtk
		with: CrGtkConfiguration new
]

{ #category : #initialization }
CrApplication >> useGtkDark [
	
	self 
		useBackend: #Gtk
		with: CrGtkDarkConfiguration new
]

{ #category : #initialization }
CrApplication >> useMorphic [

	self 
		useBackend: #Morphic 
		with: CrMorphicConfiguration new
]
