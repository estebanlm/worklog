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

{ #category : #initialization }
WLCronoApplication >> initialize [

	super initialize.
	self useBackend: #Morphic with: WLCronoMorphicConfiguration new
]
