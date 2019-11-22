Class {
	#name : #CrTodoAddNewCommand,
	#superclass : #CmCommand,
	#category : #'Crono-Spec-View-Todo'
}

{ #category : #default }
CrTodoAddNewCommand class >> defaultDescription [

	^ 'Add a new task to the current active list.'
]

{ #category : #default }
CrTodoAddNewCommand class >> defaultName [

	^ 'New Task'
]

{ #category : #converting }
CrTodoAddNewCommand >> asSpecCommand [ 
	
	^ super asSpecCommand 
		iconProvider: CrApplication current;
		iconNamed: #add;
		yourself
]

{ #category : #executing }
CrTodoAddNewCommand >> execute [
	
	self halt
]
