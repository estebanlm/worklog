Class {
	#name : #CrCommand,
	#superclass : #CmCommand,
	#category : #'Crono-Spec-View-Base'
}

{ #category : #initialization }
CrCommand class >> defaultIconName [

	^ nil
]

{ #category : #accessing }
CrCommand >> application [

	^ CrApplication current
]

{ #category : #converting }
CrCommand >> asSpecCommand [ 
	
	^ super asSpecCommand 
		iconProvider: self application;
		iconName: self class defaultIconName;
		yourself
]
