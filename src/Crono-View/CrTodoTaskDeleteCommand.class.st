Class {
	#name : #CrTodoTaskDeleteCommand,
	#superclass : #CrCommand,
	#category : #'Crono-View-Todo-Commands'
}

{ #category : #default }
CrTodoTaskDeleteCommand class >> defaultDescription [

	^ 'Delete task.'
]

{ #category : #default }
CrTodoTaskDeleteCommand class >> defaultName [

	^ 'Delete'
]

{ #category : #default }
CrTodoTaskDeleteCommand class >> defaultShortcut [

	^ $x platformMeta
]

{ #category : #executing }
CrTodoTaskDeleteCommand >> execute [
	
	self flag: #TODO. "Confirm!"
	
	self todoList 
		removeTask: self task 
		follow: true.
	context refresh.
	
	context application notificationCenter
		notify: (CrTaskChangedNotification newTask: self task);
		notify: (CrListChangedNotification newList: self todoList)	
	
]

{ #category : #accessing }
CrTodoTaskDeleteCommand >> task [

	^ context activeTask
]

{ #category : #accessing }
CrTodoTaskDeleteCommand >> todoList [

	^ context activeTodoList
]
