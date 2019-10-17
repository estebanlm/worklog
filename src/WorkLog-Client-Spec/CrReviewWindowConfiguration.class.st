Class {
	#name : #CrReviewWindowConfiguration,
	#superclass : #WLConfiguration,
	#instVars : [
		'bounds',
		'reviewDays'
	],
	#category : #'WorkLog-Client-Spec'
}

{ #category : #accessing }
CrReviewWindowConfiguration class >> fileName [

	^ 'reviewWindow.ston'
]

{ #category : #accessing }
CrReviewWindowConfiguration >> bounds [
	^ bounds ifNil: [ 0@0 extent: 720@700 ]
]

{ #category : #accessing }
CrReviewWindowConfiguration >> bounds: anObject [
	bounds := anObject
]

{ #category : #writing }
CrReviewWindowConfiguration >> referenceExists: reference [
	
	reference ensureDelete
]

{ #category : #accessing }
CrReviewWindowConfiguration >> reviewDays [
	^ reviewDays ifNil: [ 1 ]
]

{ #category : #accessing }
CrReviewWindowConfiguration >> reviewDays: anObject [
	reviewDays := anObject
]
