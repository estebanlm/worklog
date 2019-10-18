Class {
	#name : #CrWindowConfiguration,
	#superclass : #WLConfiguration,
	#instVars : [
		'bounds'
	],
	#category : #'Crono-Spec-Config'
}

{ #category : #accessing }
CrWindowConfiguration >> bounds [

	^ bounds ifNil: [ self defaultBounds ]
]

{ #category : #accessing }
CrWindowConfiguration >> bounds: anObject [
	bounds := anObject
]

{ #category : #accessing }
CrWindowConfiguration >> defaultBounds [

	^ 600@400
]
