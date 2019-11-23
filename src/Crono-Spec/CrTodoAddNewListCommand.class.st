Class {
	#name : #CrTodoAddNewListCommand,
	#superclass : #CrCommand,
	#category : #'Crono-Spec-View-Todo'
}

{ #category : #default }
CrTodoAddNewListCommand class >> defaultDescription [

	^ 'Add a new user list.'
]

{ #category : #initialization }
CrTodoAddNewListCommand class >> defaultIconName [

	^ #grayAdd
]

{ #category : #default }
CrTodoAddNewListCommand class >> defaultName [

	^ 'New List'
]

{ #category : #converting }
CrTodoAddNewListCommand >> asSpecCommand [

	^ super asSpecCommand 
		shortcutKey: $n shift platformMeta;
		yourself
]

{ #category : #executing }
CrTodoAddNewListCommand >> execute [
	
	(CrTodoItemPresenter newApplication: self application)
		todoList: self todoList;
		onAdd: [ :todo | context itemWasAdded: todo ];
		openDialogWithSpec
]

{ #category : #accessing }
CrTodoAddNewListCommand >> list [

	^ context activeList
]

{ #category : #'as yet unclassified' }
CrTodoAddNewListCommand >> todoList [
	
	^ context activeTodoList
]
