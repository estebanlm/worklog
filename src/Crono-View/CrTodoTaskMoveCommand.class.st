Class {
	#name : #CrTodoTaskMoveCommand,
	#superclass : #CrCommand,
	#category : #'Crono-View-Todo-Commands'
}

{ #category : #default }
CrTodoTaskMoveCommand class >> defaultDescription [

	^ 'Change the focus status of a task.'
]

{ #category : #default }
CrTodoTaskMoveCommand class >> defaultName [

	^ 'Move'
]

{ #category : #converting }
CrTodoTaskMoveCommand >> asSpecCommand [

	^ super asSpecCommand 
		shortcutKey: $m platformMeta;
		yourself
]

{ #category : #executing }
CrTodoTaskMoveCommand >> execute [
	
]
