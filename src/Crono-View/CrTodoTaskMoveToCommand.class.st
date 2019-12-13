Class {
	#name : #CrTodoTaskMoveToCommand,
	#superclass : #CrCommand,
	#category : #'Crono-View-Todo-Commands'
}

{ #category : #default }
CrTodoTaskMoveToCommand class >> defaultDescription [

	^ 'Change the focus status of a task.'
]

{ #category : #default }
CrTodoTaskMoveToCommand class >> defaultName [

	^ 'Move To...'
]

{ #category : #converting }
CrTodoTaskMoveToCommand >> asSpecCommand [

	^ super asSpecCommand 
		shortcutKey: $m platformMeta;
		yourself
]

{ #category : #executing }
CrTodoTaskMoveToCommand >> execute [
	
]
