Class {
	#name : #CrTaskRemovedNotification,
	#superclass : #CrTaskNotification,
	#category : #'Crono-View-Todo-Notifications'
}

{ #category : #accessing }
CrTaskRemovedNotification >> dispatchTo: anObject [

	anObject noteTaskRemoved: self
]
