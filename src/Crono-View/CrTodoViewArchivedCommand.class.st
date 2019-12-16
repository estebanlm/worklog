Class {
	#name : #CrTodoViewArchivedCommand,
	#superclass : #CrCommand,
	#category : #'Crono-View-Todo-Commands'
}

{ #category : #default }
CrTodoViewArchivedCommand class >> defaultDescription [

	^ 'View archived tasks.'
]

{ #category : #default }
CrTodoViewArchivedCommand class >> defaultName [

	^ 'View Archive'
]

{ #category : #executing }
CrTodoViewArchivedCommand >> execute [
	
	context toggleShownArchived
]
