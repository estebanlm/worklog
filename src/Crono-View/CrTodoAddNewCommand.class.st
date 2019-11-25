Class {
	#name : #CrTodoAddNewCommand,
	#superclass : #CrCommand,
	#category : #'Crono-View-Todo-Commands'
}

{ #category : #default }
CrTodoAddNewCommand class >> defaultDescription [

	^ 'Add a new task to the current active list.'
]

{ #category : #initialization }
CrTodoAddNewCommand class >> defaultIconName [

	^ #add
]

{ #category : #default }
CrTodoAddNewCommand class >> defaultName [

	^ 'New Task'
]

{ #category : #converting }
CrTodoAddNewCommand >> asSpecCommand [

	^ super asSpecCommand 
		shortcutKey: $n platformMeta;
		yourself
]

{ #category : #executing }
CrTodoAddNewCommand >> execute [
	
	(CrTodoTaskPanel newApplication: self application)
		todoList: self todoList;
		onAdd: [ :todo | context itemWasAdded: todo ];
		openDialogWithSpec
]

{ #category : #'as yet unclassified' }
CrTodoAddNewCommand >> todoList [
	
	^ context activeTodoList
]