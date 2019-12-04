"
I am a copy of class CrTodoAddNewCronoCommand. This comment is copied from there, and might not be entirely accurate

I create a new ""crono"" (a task done)
"
Class {
	#name : #CrTodoReviewCronoCommand,
	#superclass : #CrCommand,
	#category : #'Crono-View-Todo-Commands'
}

{ #category : #default }
CrTodoReviewCronoCommand class >> defaultDescription [

	^ 'Review done tasks.'
]

{ #category : #initialization }
CrTodoReviewCronoCommand class >> defaultIconName [

	^ #reviewDone
]

{ #category : #default }
CrTodoReviewCronoCommand class >> defaultName [

	^ 'Review'
]

{ #category : #converting }
CrTodoReviewCronoCommand >> asSpecCommand [

	^ super asSpecCommand 
		shortcutKey: $r platformMeta;
		yourself
]

{ #category : #executing }
CrTodoReviewCronoCommand >> execute [
	
	CrReviewWindow open
]
