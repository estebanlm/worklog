Class {
	#name : #CrNotificationCenterTest,
	#superclass : #TestCase,
	#category : #'Crono-Tests'
}

{ #category : #tests }
CrNotificationCenterTest >> testSubscriptionIsRemovedWhenObjectIsNoLongerReferenced [
	| nc object |
	
	nc := CrNotificationCenter new.
	object := CrNotificationCenterObjectMock new.
	nc subscribe: object to: CrAnnouncementMock.
	
	self denyEmpty: (nc subscriptionsTo: CrAnnouncementMock).
	
	object := nil.
	3 timesRepeat: [ Smalltalk garbageCollect ].
	
	self assertEmpty: (nc subscriptionsTo: CrAnnouncementMock).
	
]
