Class {
	#name : #CrTodoAddListCommand,
	#superclass : #CrCommand,
	#category : #'Crono-View-Todo-Commands'
}

{ #category : #default }
CrTodoAddListCommand class >> defaultDescription [

	^ 'Add a new user list.'
]

{ #category : #initialization }
CrTodoAddListCommand class >> defaultIconName [

	^ #grayAdd
]

{ #category : #default }
CrTodoAddListCommand class >> defaultName [

	^ 'New List'
]

{ #category : #converting }
CrTodoAddListCommand >> asSpecCommand [

	^ super asSpecCommand 
		shortcutKey: $n shift platformMeta;
		yourself
]

{ #category : #executing }
CrTodoAddListCommand >> execute [
	| dialog list |
	
	dialog := CrRequestDialog new
		title: 'New List';
		label: 'Please enter your list name';
		openDialogWithSpec.
	
	dialog isOk ifFalse: [ ^ self ].
	dialog presenter text isEmptyOrNil ifTrue: [ ^ self ].
	
	list := CrTodoList newName: dialog presenter text.
	list save.
	
	context application notificationCenter notify: (CrListAddedNotification newList: list)
]
