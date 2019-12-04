Class {
	#name : #CrNotificationCenter,
	#superclass : #Object,
	#instVars : [
		'subscriptions'
	],
	#category : #'Crono-View-Application'
}

{ #category : #'as yet unclassified' }
CrNotificationCenter >> basicSubscribe: anObject to: anAnnouncementClass [

	(subscriptions 
		at: anAnnouncementClass
		ifAbsentPut: [ WeakSet new ])
		add: anObject
]

{ #category : #initialization }
CrNotificationCenter >> initialize [

	super initialize.
	subscriptions := Dictionary new
]

{ #category : #'as yet unclassified' }
CrNotificationCenter >> subscribe: anObject to: aNotificationClass [
	| class |
	
	class := aNotificationClass.
	"registers objects to top notification"
	[ class = Object ] 
	whileFalse: [ 
		self basicSubscribe: anObject to: class.
	 	class := class superclass ]
]

{ #category : #'as yet unclassified' }
CrNotificationCenter >> subscriptionsTo: anAnnouncementClass [ 
	
	^ (subscriptions 
		at: anAnnouncementClass 
		ifAbsent: [ #() ])
		asArray
]
