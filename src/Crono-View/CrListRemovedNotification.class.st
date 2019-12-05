Class {
	#name : #CrListRemovedNotification,
	#superclass : #CrListNotification,
	#category : #'Crono-View-Todo-Notifications'
}

{ #category : #accessing }
CrListRemovedNotification >> dispatchTo: anObject [ 

	anObject noteListRemoved: self
]
