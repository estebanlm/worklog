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

{ #category : #default }
CrTodoTaskMoveCommand class >> defaultShortcut [

	^ $m platformMeta
]

{ #category : #executing }
CrTodoTaskMoveCommand >> execute [
	
]
