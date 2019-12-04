"
I create a new ""crono"" (a task done)
"
Class {
	#name : #CrTodoAddNewCronoCommand,
	#superclass : #CrCommand,
	#category : #'Crono-View-Todo-Commands'
}

{ #category : #default }
CrTodoAddNewCronoCommand class >> defaultDescription [

	^ 'Add a new DONE unsorted task.'
]

{ #category : #initialization }
CrTodoAddNewCronoCommand class >> defaultIconName [

	^ #done
]

{ #category : #default }
CrTodoAddNewCronoCommand class >> defaultName [

	^ 'New DONE Task'
]

{ #category : #converting }
CrTodoAddNewCronoCommand >> asSpecCommand [

	^ super asSpecCommand 
		shortcutKey: $d platformMeta;
		yourself
]

{ #category : #executing }
CrTodoAddNewCronoCommand >> execute [
	
	CrCronoDialog openDialog
]
