Class {
	#name : #CrTodoAddTaskCommand,
	#superclass : #CrCommand,
	#category : #'Crono-View-Todo-Commands'
}

{ #category : #default }
CrTodoAddTaskCommand class >> defaultDescription [

	^ 'Add a new task to the current active list.'
]

{ #category : #initialization }
CrTodoAddTaskCommand class >> defaultIconName [

	^ #add
]

{ #category : #default }
CrTodoAddTaskCommand class >> defaultName [

	^ 'New Task'
]

{ #category : #converting }
CrTodoAddTaskCommand >> asSpecCommand [

	^ super asSpecCommand 
		shortcutKey: $n platformMeta;
		yourself
]

{ #category : #executing }
CrTodoAddTaskCommand >> execute [
	
	(CrTodoAddTaskPanel newApplication: self application)
		todoList: self todoList;
		openDialogWithSpec
]

{ #category : #accessing }
CrTodoAddTaskCommand >> todoList [
	
	^ context activeTodoList
]
