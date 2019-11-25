Class {
	#name : #CrTodoAddNewListCommand,
	#superclass : #CrCommand,
	#category : #'Crono-View-Todo-Commands'
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
	| dialog list |
	
	dialog := CrRequestDialog new
		title: 'Test';
		label: 'Please blah';
		openDialogWithSpec.
	
	dialog isOk ifFalse: [ ^ self ].
	dialog presenter text isEmptyOrNil ifTrue: [ ^ self ].
	
	list := CrTodoList newName: dialog presenter text.
	list writeToDisk.
	context listWasAdded: list
]
