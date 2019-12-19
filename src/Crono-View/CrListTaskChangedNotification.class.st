Class {
	#name : #CrListTaskChangedNotification,
	#superclass : #CrListChangedNotification,
	#instVars : [
		'task'
	],
	#category : #'Crono-View-Todo-Notifications'
}

{ #category : #'instance creation' }
CrListTaskChangedNotification class >> newList: aTodoList task: aTask [

	^ self new 
		list: aTodoList;
		task: aTask;
		yourself
]

{ #category : #accessing }
CrListTaskChangedNotification class >> receiverSelector [

	^ #noteListTaskChanged:
]

{ #category : #accessing }
CrListTaskChangedNotification >> task [
	^ task
]

{ #category : #accessing }
CrListTaskChangedNotification >> task: anObject [
	task := anObject
]
