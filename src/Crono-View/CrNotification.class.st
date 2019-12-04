Class {
	#name : #CrNotification,
	#superclass : #Object,
	#category : #'Crono-View-Application'
}

{ #category : #accessing }
CrNotification class >> systemIconName [

	^ #announcementIcon
]

{ #category : #accessing }
CrNotification >> dispatchTo: anObject [

	anObject handleNotification: self
]
