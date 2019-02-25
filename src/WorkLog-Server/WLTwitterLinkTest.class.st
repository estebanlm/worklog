Class {
	#name : #WLTwitterLinkTest,
	#superclass : #WLExternalLinkTest,
	#category : 'WorkLog-Server-Tests'
}

{ #category : #accessing }
WLTwitterLinkTest >> linkClass [
	^ WLTwitterLink
]

{ #category : #accessing }
WLTwitterLinkTest >> urlsToTest [
	^ #('https://twitter.com/estebanlm/status/676666606404153344')
]
