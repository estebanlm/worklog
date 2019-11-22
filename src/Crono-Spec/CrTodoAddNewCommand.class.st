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

{ #category : #executing }
CrTodoAddNewCommand >> execute [
	
	(CrTodoItemPresenter newApplication: self application)
		todoList: self todoList;
		onAdd: [ :todo | context announceItemAdded: todo ];
		openDialogWithSpec
]

{ #category : #accessing }
CrTodoAddNewCommand >> list [

	^ context activeList
]
