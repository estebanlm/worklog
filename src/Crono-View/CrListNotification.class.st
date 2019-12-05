Class {
	#name : #CrListNotification,
	#superclass : #CrNotification,
	#instVars : [
		'list'
	],
	#category : #'Crono-View-Todo-Notifications'
}

{ #category : #'instance creation' }
CrListNotification class >> newList: aTodoList [

	^ self new list: aTodoList
]

{ #category : #accessing }
CrListNotification >> dispatchTo: anObject [ 

	anObject noteList: self
]

{ #category : #accessing }
CrListNotification >> list [
	^ list
]

{ #category : #accessing }
CrListNotification >> list: anObject [
	list := anObject
]
