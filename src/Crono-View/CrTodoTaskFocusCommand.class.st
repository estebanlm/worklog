Class {
	#name : #CrTodoTaskFocusCommand,
	#superclass : #CrCommand,
	#category : #'Crono-View-Todo-Commands'
}

{ #category : #default }
CrTodoTaskFocusCommand class >> defaultDescription [

	^ 'Focus a task.'
]

{ #category : #default }
CrTodoTaskFocusCommand class >> defaultName [

	^ 'Focus'
]

{ #category : #converting }
CrTodoTaskFocusCommand >> asSpecCommand [

	^ super asSpecCommand 
		shortcutKey: $f platformMeta;
		yourself
]

{ #category : #executing }
CrTodoTaskFocusCommand >> execute [
	
	self inform: 'OK'
]
