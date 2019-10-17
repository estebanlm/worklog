Class {
	#name : #WLCronoReviewWindowConfiguration,
	#superclass : #WLConfiguration,
	#instVars : [
		'bounds',
		'reviewDays'
	],
	#category : #'WorkLog-Client-Spec'
}

{ #category : #accessing }
WLCronoReviewWindowConfiguration class >> fileName [

	^ 'reviewWindow.ston'
]

{ #category : #accessing }
WLCronoReviewWindowConfiguration >> bounds [
	^ bounds ifNil: [ 0@0 extent: 720@700 ]
]

{ #category : #accessing }
WLCronoReviewWindowConfiguration >> bounds: anObject [
	bounds := anObject
]

{ #category : #writing }
WLCronoReviewWindowConfiguration >> referenceExists: reference [
	
	reference ensureDelete
]

{ #category : #accessing }
WLCronoReviewWindowConfiguration >> reviewDays [
	^ reviewDays ifNil: [ 1 ]
]

{ #category : #accessing }
WLCronoReviewWindowConfiguration >> reviewDays: anObject [
	reviewDays := anObject
]
