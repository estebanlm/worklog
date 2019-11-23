Class {
	#name : #CrTodoAddNewCommand,
	#superclass : #CrCommand,
	#category : #'Crono-Spec-View-Todo'
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
	
	(CrTodoItemPresenter newApplication: self application)
		todoList: self todoList;
		onAdd: [ :todo | context itemWasAdded: todo ];
		openDialogWithSpec
]

{ #category : #accessing }
CrTodoAddNewCommand >> list [

	^ context activeList
]

{ #category : #'as yet unclassified' }
CrTodoAddNewCommand >> todoList [
	
	^ context activeTodoList
]
