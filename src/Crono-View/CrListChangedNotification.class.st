Class {
	#name : #CrListChangedNotification,
	#superclass : #CrListNotification,
	#category : #'Crono-View-Todo-Notifications'
}

{ #category : #accessing }
CrListChangedNotification >> dispatchTo: anObject [ 

	anObject noteListChanged: self
]
