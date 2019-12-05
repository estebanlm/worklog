Class {
	#name : #CrListAddedNotification,
	#superclass : #CrListNotification,
	#category : #'Crono-View-Todo-Notifications'
}

{ #category : #accessing }
CrListAddedNotification >> dispatchTo: anObject [ 

	anObject noteListAdded: self
]
