"
I am a base Notification for a hierarchy of things I can dispatch.
A notification will send #note*: messages to subscribers to them. This is opposite to other 
implementations that were allowing users to define any selector to respond to notifications, 
this is *by design*, to enforce a protocol and avoid doing hacks to preserve the system from 
leaks.
"
Class {
	#name : #CrNotification,
	#superclass : #Object,
	#category : #'Crono-View-Application'
}

{ #category : #converting }
CrNotification class >> asNotification [

	^ self new
]

{ #category : #accessing }
CrNotification class >> systemIconName [

	^ #announcementIcon
]

{ #category : #converting }
CrNotification >> asNotification [

	^ self
]

{ #category : #accessing }
CrNotification >> dispatchTo: anObject [

	anObject note: self
]
