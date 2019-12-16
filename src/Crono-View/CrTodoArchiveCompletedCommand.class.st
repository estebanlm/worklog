Class {
	#name : #CrTodoArchiveCompletedCommand,
	#superclass : #CrCommand,
	#category : #'Crono-View-Todo-Commands'
}

{ #category : #default }
CrTodoArchiveCompletedCommand class >> defaultDescription [

	^ 'Move completed tasks to archive.'
]

{ #category : #default }
CrTodoArchiveCompletedCommand class >> defaultName [

	^ 'Archive'
]

{ #category : #executing }
CrTodoArchiveCompletedCommand >> execute [
	
	self todoList archiveCompletedTasks.
	context refresh.
	
	context application notificationCenter 
		notify: (CrListAddedNotification newList: self todoList)
]

{ #category : #accessing }
CrTodoArchiveCompletedCommand >> todoList [

	^ context activeTodoList
]