Class {
	#name : #CrApplication,
	#superclass : #SpApplication,
	#classVars : [
		'Current'
	],
	#category : #'WorkLog-Client-Spec'
}

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
			(aBuilder item: #'add new crono log entry')
				target: CrLogDialog;
				selector: #open;
				order: 10. 
			(aBuilder item: #'review crono logs')
				target: CrReviewWindow;
				selector: #open;
				order: 20 ]
]

{ #category : #initialization }
CrApplication >> initialize [

	super initialize.
	self useGtk
]

{ #category : #running }
CrApplication >> run [

	super run.
	Current := self
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
