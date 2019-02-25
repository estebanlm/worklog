Class {
	#name : #WLReferenceCollector,
	#superclass : #PRVisitor,
	#instVars : [
		'objects'
	],
	#category : 'WorkLog-Server-Model'
}

{ #category : #testing }
WLReferenceCollector class >> isAbstract [ 
	^ false
]

{ #category : #initialization }
WLReferenceCollector >> initialize [
	super initialize.
	objects := Array new writeStream 
]

{ #category : #accessing }
WLReferenceCollector >> objects [
	^ objects contents
]

{ #category : #'visiting-document' }
WLReferenceCollector >> visitReference: aReference [
	objects nextPut: aReference.
	^ super visitReference: aReference
]
