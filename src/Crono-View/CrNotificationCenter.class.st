"
I am a notification center with the purpose of dispatch notifications to all subscribers.
I ensure the subscribers are weakly referenced, to avoid possible leaks.
"
Class {
	#name : #CrNotificationCenter,
	#superclass : #Object,
	#instVars : [
		'subscriptions'
	],
	#category : #'Crono-View-Application'
}

{ #category : #private }
CrNotificationCenter >> dispatchNotification: aNotification to: anObject [

	aNotification dispatchTo: anObject
]

{ #category : #private }
CrNotificationCenter >> dispatchNotification: aNotification toAll: aSet [

	aSet do: [ :each | 
		self dispatchNotification: aNotification to: each ]
]

{ #category : #initialization }
CrNotificationCenter >> initialize [

	super initialize.
	subscriptions := Dictionary new
]

{ #category : #notifying }
CrNotificationCenter >> notify: aNotification [
	"I will send notification to all direct subscribers, but also to subscribers to the parent(s)
	 of the notification. For example, if I have 
		Notification subclass: MyNotification
	 if I notify MyNotification, I will dispatch to subscribers of MyNotification and Notification"
	| class realNotification |
	 
	realNotification := aNotification asNotification.
	class := realNotification class.
	[ class = Object ] 
	whileFalse: [ 
		(self subscriptionsTo: class) do: [ :each | 
			self dispatchNotification: realNotification to: each ].	
		class := class superclass ]
]

{ #category : #subscribing }
CrNotificationCenter >> subscribe: anObject to: anAnnouncementClass [

	(subscriptions 
		at: anAnnouncementClass
		ifAbsentPut: [ WeakSet new ])
		add: anObject
]

{ #category : #subscribing }
CrNotificationCenter >> subscriptionsTo: anAnnouncementClass [ 
	
	^ (subscriptions 
		at: anAnnouncementClass 
		ifAbsent: [ #() ])
		asArray
]
