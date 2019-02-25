"
I represent an external link.
"
Class {
	#name : #WLExternalLink,
	#superclass : #Object,
	#instVars : [
		'url'
	],
	#category : 'WorkLog-Server-Model-Link'
}

{ #category : #testing }
WLExternalLink class >> isSuitableFor: aLink [
	self subclassResponsibility
]

{ #category : #'instance creation' }
WLExternalLink class >> link: aLink [
	^ (self suitableClassFor: aLink) basicNew
		initializeLink: aLink;
		yourself
]

{ #category : #accessing }
WLExternalLink class >> priority [
	^ 0
]

{ #category : #private }
WLExternalLink class >> suitableClassFor: aLink [ 
	^ (self allSubclasses 
		sorted: [ :a :b | a priority < b priority ])
		detect: [ :each | each isSuitableFor: aLink ] 
]

{ #category : #initialization }
WLExternalLink >> initializeLink: aLink [
	self initialize.
	url := aLink url.
]

{ #category : #accessing }
WLExternalLink >> thumbnailUrl [
	^ self url
]

{ #category : #accessing }
WLExternalLink >> title [
	^ self subclassResponsibility
]

{ #category : #accessing }
WLExternalLink >> url [
	^ url
]
