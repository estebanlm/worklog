Class {
	#name : #WLCronoApplication,
	#superclass : #SpApplication,
	#classVars : [
		'Current'
	],
	#category : #'WorkLog-Client-Spec'
}

{ #category : #accessing }
WLCronoApplication class >> current [

	^ Current ifNil: [ 
		WLCronoApplication new run.
		Current ]
]

{ #category : #'world menu' }
WLCronoApplication class >> menuCommandOn: aBuilder [
	<worldMenu>

	(aBuilder item: #Crono)
		order: 1000.0;
		target: self;
		parent: #Tools;
		with: [ 
			(aBuilder item: #'add new crono log entry')
				target: WLCronoDialog;
				selector: #open;
				order: 10. 
			(aBuilder item: #'review crono logs')
				target: WLCronoReviewWindow;
				selector: #open;
				order: 20 ]
]

{ #category : #initialization }
WLCronoApplication >> initialize [

	super initialize.
	self useGtk
]

{ #category : #running }
WLCronoApplication >> run [

	super run.
	Current := self
]

{ #category : #initialization }
WLCronoApplication >> useGtk [
	
	self 
		useBackend: #Gtk
		with: WLCronoGtkConfiguration new
]

{ #category : #initialization }
WLCronoApplication >> useGtkDark [
	
	self 
		useBackend: #Gtk
		with: WLCronoGtkDarkConfiguration new
]

{ #category : #initialization }
WLCronoApplication >> useMorphic [

	self 
		useBackend: #Morphic 
		with: WLCronoMorphicConfiguration new
]
