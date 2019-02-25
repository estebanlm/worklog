"
I'm a pier extension to handle fogbugz links.
You can use 

	*case: 12345* 
	
... and your post will point to Pharo FogBugz issue tracker
"
Class {
	#name : #WLPierCaseLink,
	#superclass : #PRExternalLink,
	#category : 'WorkLog-Server-Model-Pier'
}

{ #category : #testing }
WLPierCaseLink class >> isValidReference: aString [
	"*case:12345*"
	^ aString beginsWith: 'case:'
]

{ #category : #accessing }
WLPierCaseLink class >> priority [
	^ 50
]

{ #category : #visiting }
WLPierCaseLink >> accept: aVisitor [
	aVisitor visitFogbugzLink: self
]

{ #category : #'accessing-dynamic' }
WLPierCaseLink >> alias [
	"I force the alias"
	^ 'Case ', self caseNumber
]

{ #category : #converting }
WLPierCaseLink >> asReferencedObject [
	^ WLFogbugzLink link: self
]

{ #category : #private }
WLPierCaseLink >> caseNumber [
	^ (self reference allButFirst: 5) trimBoth
]

{ #category : #'accessing-dynamic' }
WLPierCaseLink >> urlEntry [
	^ 'https://pharo.fogbugz.com/f/cases/', self caseNumber
]
