Class {
	#name : #CrTaskNotification,
	#superclass : #CrNotification,
	#instVars : [
		'task'
	],
	#category : #'Crono-View-Todo-Notifications'
}

{ #category : #'instance creation' }
CrTaskNotification class >> newTask: aTask [

	^ self new task: aTask
]

{ #category : #accessing }
CrTaskNotification >> dispatchTo: anObject [

	anObject noteTask: self
]

{ #category : #accessing }
CrTaskNotification >> task [
	^ task
]

{ #category : #accessing }
CrTaskNotification >> task: anObject [
	task := anObject
]
