Class {
	#name : #CrNotificationMock,
	#superclass : #CrNotification,
	#category : #'Crono-Tests'
}

{ #category : #accessing }
CrNotificationMock >> dispatchTo: anObject [

	anObject noteMock: self
]
