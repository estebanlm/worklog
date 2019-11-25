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
	
	self halt
]
