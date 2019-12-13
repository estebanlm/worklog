Class {
	#name : #CrTodoTaskFocusCommand,
	#superclass : #CrCommand,
	#category : #'Crono-View-Todo-Commands'
}

{ #category : #default }
CrTodoTaskFocusCommand class >> defaultDescription [

	^ 'Focus a task.'
]

{ #category : #default }
CrTodoTaskFocusCommand class >> defaultName [

	^ 'Toggle Focus'
]

{ #category : #converting }
CrTodoTaskFocusCommand >> asSpecCommand [

	^ super asSpecCommand 
		shortcutKey: $f platformMeta;
		yourself
]

{ #category : #executing }
CrTodoTaskFocusCommand >> execute [
	
	context selectedItemToggleFocus
]

{ #category : #accessing }
CrTodoTaskFocusCommand >> task [

	^ context activeTask
]
