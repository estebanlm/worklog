Class {
	#name : #WLStackoverflowLinkTest,
	#superclass : #WLExternalLinkTest,
	#category : 'WorkLog-Server-Tests'
}

{ #category : #accessing }
WLStackoverflowLinkTest >> linkClass [
	^ WLStackoverflowLink
]

{ #category : #accessing }
WLStackoverflowLinkTest >> urlsToTest [
	^ #('http://stackoverflow.com/questions/1061818/stack-allocation-padding-and-alignment')
]
