Class {
	#name : #CrApplication,
	#superclass : #SpApplication,
	#instVars : [
		'standalone'
	],
	#classVars : [
		'Current'
	],
	#category : #'Crono-Spec-Application'
}

{ #category : #accessing }
CrApplication class >> applicationName [

	^ 'crono'
]

{ #category : #accessing }
CrApplication class >> current [

	^ Current ifNil: [ 
		CrApplication new run.
		Current ]
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
				selector: #open;
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

{ #category : #initialization }
CrApplication >> initialize [

	standalone := false.
	super initialize.
	CrApplicationConfiguration readFromFileSystem isDarkTheme
		ifTrue: [ self useGtkDark ]
		ifFalse: [ self useGtk ]
	
]

{ #category : #testing }
CrApplication >> isStandalone [

	^ standalone
]

{ #category : #initialization }
CrApplication >> prepareAsStandaloneApplication [
	
	standalone := true
]

{ #category : #running }
CrApplication >> run [

	Current := self.
	super run	
]

{ #category : #running }
CrApplication >> start [

	CrTodoWindow open
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
