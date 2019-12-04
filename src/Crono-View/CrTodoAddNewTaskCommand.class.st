Class {
	#name : #CrTodoAddNewTaskCommand,
	#superclass : #CrCommand,
	#category : #'Crono-View-Todo-Commands'
}

{ #category : #default }
CrTodoAddNewTaskCommand class >> defaultDescription [

	^ 'Add a new task to the current active list.'
]

{ #category : #initialization }
CrTodoAddNewTaskCommand class >> defaultIconName [

	^ #add
]

{ #category : #default }
CrTodoAddNewTaskCommand class >> defaultName [

	^ 'New Task'
]

{ #category : #converting }
CrTodoAddNewTaskCommand >> asSpecCommand [

	^ super asSpecCommand 
		shortcutKey: $n platformMeta;
		yourself
]

{ #category : #executing }
CrTodoAddNewTaskCommand >> execute [
	
	(CrTodoTaskPanel newApplication: self application)
		todoList: self todoList;
		onAdd: [ :todo | context itemWasAdded: todo ];
		openDialogWithSpec
]

{ #category : #'as yet unclassified' }
CrTodoAddNewTaskCommand >> todoList [
	
	^ context activeTodoList
]
