Class {
	#name : #CrTodoTaskDeleteCommand,
	#superclass : #CrCommand,
	#category : #'Crono-View-Todo-Commands'
}

{ #category : #default }
CrTodoTaskDeleteCommand class >> defaultDescription [

	^ 'Delete task.'
]

{ #category : #default }
CrTodoTaskDeleteCommand class >> defaultName [

	^ 'Delete'
]

{ #category : #converting }
CrTodoTaskDeleteCommand >> asSpecCommand [

	^ super asSpecCommand
		shortcutKey: $x platformMeta;
		yourself
]

{ #category : #executing }
CrTodoTaskDeleteCommand >> execute [
	
	self todoList 
		removeTask: self task 
		follow: true.
	context refresh
	
]

{ #category : #accessing }
CrTodoTaskDeleteCommand >> task [

	^ context activeTask
]

{ #category : #accessing }
CrTodoTaskDeleteCommand >> todoList [

	^ context activeTodoList
]
