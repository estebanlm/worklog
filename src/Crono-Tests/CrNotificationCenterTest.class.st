Class {
	#name : #CrNotificationCenterTest,
	#superclass : #TestCase,
	#category : #'Crono-Tests'
}

{ #category : #tests }
CrNotificationCenterTest >> testNotify [
	| nc object |
	
	nc := CrNotificationCenter new.
	object := CrNotificationCenterObjectMock new.
	nc subscribe: object to: CrNotificationMock.
	
	nc notify: CrNotificationMock.	

	self assert: object noted size equals: 1. 
	self assert: object noted first class equals: CrNotificationMock
]

{ #category : #tests }
CrNotificationCenterTest >> testNotifyWhenSubscribedToClassAndSuperclass [
	| nc object |
	
	nc := CrNotificationCenter new.
	object := CrNotificationCenterObjectMock new.
	nc subscribe: object to: CrNotification.
	nc subscribe: object to: CrNotificationMock.
	
	nc notify: CrNotification.	

	self assert: object noted size equals: 1. 
	self assert: object noted first class equals: CrNotification
]

{ #category : #tests }
CrNotificationCenterTest >> testNotifyWhenSubscribedToSuperclass [
	| nc object |
	
	nc := CrNotificationCenter new.
	object := CrNotificationCenterObjectMock new.
	nc subscribe: object to: CrNotification.
	
	nc notify: CrNotificationMock.	

	self assert: object noted size equals: 1. 
	self assert: object noted first class equals: CrNotificationMock
]

{ #category : #tests }
CrNotificationCenterTest >> testNotifyWhenSubscribedToSuperclassAndClass [
	| nc object |
	
	nc := CrNotificationCenter new.
	object := CrNotificationCenterObjectMock new.
	nc subscribe: object to: CrNotification.
	nc subscribe: object to: CrNotificationMock.
	
	nc notify: CrNotificationMock.	

	self assert: object noted size equals: 2. 
	self assert: object noted first class equals: CrNotificationMock.
	self assert: object noted second class equals: CrNotificationMock
]

{ #category : #tests }
CrNotificationCenterTest >> testSubscriptionIsRemovedWhenObjectIsNoLongerReferenced [
	| nc object |
	
	nc := CrNotificationCenter new.
	object := CrNotificationCenterObjectMock new.
	nc subscribe: object to: CrNotificationMock.
	
	self denyEmpty: (nc subscriptionsTo: CrNotificationMock).
	
	object := nil.
	Smalltalk garbageCollect.
	
	self assertEmpty: (nc subscriptionsTo: CrNotificationMock).
	self assertEmpty: (nc subscriptionsTo: CrNotificationMock superclass)	
]
