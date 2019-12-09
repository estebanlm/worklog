Class {
	#name : #CrTodoRemoveTaskCommand,
	#superclass : #CrCommand,
	#category : #'Crono-View-Todo-Commands'
}

{ #category : #default }
CrTodoRemoveTaskCommand class >> defaultDescription [

	^ 'Remove a task.'
]

{ #category : #default }
CrTodoRemoveTaskCommand class >> defaultName [

	^ 'Remove Task'
]

{ #category : #executing }
CrTodoRemoveTaskCommand >> execute [
	"Move it to trash"
	
	CrTodoList voyageRepository commit: [  
		self todoList 
			removeTask: self task;
			save.
		CrTodoList trash 
			addTask: self task;
			save ].
]

{ #category : #accessing }
CrTodoRemoveTaskCommand >> task [

	^ context activeTask
]

{ #category : #accessing }
CrTodoRemoveTaskCommand >> todoList [
	
	^ context activeTodoList
]
