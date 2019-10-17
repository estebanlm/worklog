Class {
	#name : #WLCronoReviewWindowConfiguration,
	#superclass : #WLConfiguration,
	#instVars : [
		'bounds'
	],
	#category : #'WorkLog-Client-Spec'
}

{ #category : #accessing }
WLCronoReviewWindowConfiguration class >> fileName [

	^ 'reviewWindow.ston'
]

{ #category : #accessing }
WLCronoReviewWindowConfiguration >> bounds [
	^ bounds
]

{ #category : #accessing }
WLCronoReviewWindowConfiguration >> bounds: anObject [
	bounds := anObject
]

{ #category : #writing }
WLCronoReviewWindowConfiguration >> referenceExists: reference [
	
	reference ensureDelete
]
