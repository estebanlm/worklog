Class {
	#name : #CrVirtualList,
	#superclass : #CrAbstractList,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Crono-Model'
}

{ #category : #'instance creation' }
CrVirtualList class >> new [

	self error: 'Use #uniqueInstance'
]

{ #category : #'instance creation' }
CrVirtualList class >> uniqueInstance [

	^ uniqueInstance ifNil: [ uniqueInstance := super new ]
]
