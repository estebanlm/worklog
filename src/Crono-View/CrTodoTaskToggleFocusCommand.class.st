Class {
	#name : #CrTodoTaskToggleFocusCommand,
	#superclass : #CrCommand,
	#category : #'Crono-View-Todo-Commands'
}

{ #category : #default }
CrTodoTaskToggleFocusCommand class >> defaultDescription [

	^ 'Focus a task.'
]

{ #category : #default }
CrTodoTaskToggleFocusCommand class >> defaultName [

	^ 'Toggle Focus'
]

{ #category : #converting }
CrTodoTaskToggleFocusCommand >> asSpecCommand [

	^ super asSpecCommand 
		shortcutKey: $f platformMeta;
		yourself
]

{ #category : #executing }
CrTodoTaskToggleFocusCommand >> execute [
	
	context selectedItemToggleFocus
]

{ #category : #accessing }
CrTodoTaskToggleFocusCommand >> name [

	self task ifNil: [ ^ super name ].
	^ self task isFocused
		ifTrue: [ 'Remove Focus' ]
		ifFalse: [ 'Focus' ]
]

{ #category : #accessing }
CrTodoTaskToggleFocusCommand >> task [

	^ context activeTask
]