"
I'm a sequence.
I'm used to generate unique version numbers.
"
Class {
	#name : #WLSequence,
	#superclass : #Object,
	#instVars : [
		'id',
		'number'
	],
	#category : 'WorkLog-Server-Model'
}

{ #category : #accessing }
WLSequence class >> findOrCreateById: aSymbol [
	^ (self selectOne: [ :each | each id = aSymbol ])
		ifNil: [ (self id: aSymbol) save ]
	
]

{ #category : #'instance creation' }
WLSequence class >> id: aSymbol [
	^ self new 
		id: aSymbol;
		yourself
]

{ #category : #testing }
WLSequence class >> isVoyageRoot [ 
	^ true
]

{ #category : #accessing }
WLSequence class >> nextPermaLinkNumber [
	^ (self findOrCreateById: #permalink) nextNumber.
	
]

{ #category : #accessing }
WLSequence >> id [
	^ id
]

{ #category : #accessing }
WLSequence >> id: anObject [
	id := anObject
]

{ #category : #initialization }
WLSequence >> initialize [ 
	super initialize.
	number := 0
]

{ #category : #accessing }
WLSequence >> nextNumber [
	self number: self number + 1.
	self save.
	^ self number
]

{ #category : #accessing }
WLSequence >> number [
	^ number ifNil: [ number := 0 ]
]

{ #category : #accessing }
WLSequence >> number: anObject [
	number := anObject
]
