Class {
	#name : #CrTodoTaskCommand,
	#superclass : #CrCommand,
	#instVars : [
		'state'
	],
	#category : #'Crono-View-Todo-Commands'
}

{ #category : #accessing }
CrTodoTaskCommand >> task [

	^ context activeTask
]
