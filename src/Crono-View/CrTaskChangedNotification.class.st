Class {
	#name : #CrTaskChangedNotification,
	#superclass : #CrTaskNotification,
	#category : #'Crono-View-Todo-Notifications'
}

{ #category : #accessing }
CrTaskChangedNotification >> dispatchTo: anObject [ 

	anObject noteTaskChanged: self
]
