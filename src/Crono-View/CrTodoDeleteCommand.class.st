Class {
	#name : #CrTodoDeleteCommand,
	#superclass : #CrCommand,
	#category : #'Crono-View-Todo-Commands'
}

{ #category : #default }
CrTodoDeleteCommand class >> defaultDescription [

	^ 'View archived tasks.'
]

{ #category : #default }
CrTodoDeleteCommand class >> defaultName [

	^ 'View Archive'
]

{ #category : #executing }
CrTodoDeleteCommand >> execute [
	
	context toggleShownArchived
]

{ #category : #accessing }
CrTodoDeleteCommand >> name [

	^ context shownArchived
		ifTrue: [ 'Hide Archived' ]
		ifFalse: [ 'Show Archived' ]
]
