Class {
	#name : #WLExternalLinkTest,
	#superclass : #TestCase,
	#category : 'WorkLog-Server-Tests'
}

{ #category : #testing }
WLExternalLinkTest class >> isAbstract [
	^ self = WLExternalLinkTest 
]

{ #category : #accessing }
WLExternalLinkTest >> linkClass [
	^ self subclassResponsibility
]

{ #category : #accessing }
WLExternalLinkTest >> linkTo: aString [
	^ PRExternalLink new 
		reference: aString;
		yourself
]

{ #category : #tests }
WLExternalLinkTest >> testIsSuitableFor [
	self urlsToTest do: [ :each |
		self assert: (self linkClass isSuitableFor: (self linkTo: each)) ] 
]

{ #category : #accessing }
WLExternalLinkTest >> urlsToTest [
	^ self subclassResponsibility
]
