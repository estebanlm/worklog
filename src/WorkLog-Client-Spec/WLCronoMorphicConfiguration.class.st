Class {
	#name : #WLCronoMorphicConfiguration,
	#superclass : #SpApplicationConfiguration,
	#category : #'WorkLog-Client-Spec'
}

{ #category : #'as yet unclassified' }
WLCronoMorphicConfiguration class >> cronoStyleSheet [

	^ SpStyleSTONReader fromString: '.application [ 
	.cronoText [
		Font { #name : "Source Code Pro", #size : 10 }
	]
]'
]

{ #category : #configuring }
WLCronoMorphicConfiguration >> configure: anApplication [

	super configure: anApplication.
	anApplication styleSheet: SpStyle defaultStyleSheet, self class cronoStyleSheet
]
