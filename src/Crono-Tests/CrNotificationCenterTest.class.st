Class {
	#name : #CrNotificationCenterTest,
	#superclass : #TestCase,
	#category : #'Crono-Tests'
}

{ #category : #tests }
CrNotificationCenterTest >> testSubscriptionIncludesAllHierarchy [
	| nc object |
	
	nc := CrNotificationCenter new.
	object := CrNotificationCenterObjectMock new.
	nc subscribe: object to: CrNotificationMock.
	
	self denyEmpty: (nc subscriptionsTo: CrNotificationMock).
	self denyEmpty: (nc subscriptionsTo: CrNotificationMock superclass).

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
