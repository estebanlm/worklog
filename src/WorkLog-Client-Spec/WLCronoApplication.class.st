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
