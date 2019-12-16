"
I am a virtual list. 
I can keep different kind of lists (for example, the focused tasks or archived, but also ""smart lists"").
The correspondent behaviour will be defined in my children.
"
Class {
	#name : #CrVirtualList,
	#superclass : #CrAbstractList,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Crono-Model'
}

{ #category : #accessing }
CrVirtualList class >> allLists [

	^ self allSubclasses collect: #uniqueInstance
]

{ #category : #'instance creation' }
CrVirtualList class >> new [

	self error: 'Use #uniqueInstance'
]

{ #category : #'instance creation' }
CrVirtualList class >> uniqueInstance [

	^ uniqueInstance ifNil: [ uniqueInstance := super new ]
]

{ #category : #initialization }
CrVirtualList >> onApplicationStart: anApplication [
	"Override this if the virtual list needs some initialization on startup"
]
