Class {
	#name : #WLBitbucketLinkTest,
	#superclass : #WLExternalLinkTest,
	#category : 'WorkLog-Server-Tests'
}

{ #category : #accessing }
WLBitbucketLinkTest >> linkClass [
	^ WLBitbucketLink
]

{ #category : #accessing }
WLBitbucketLinkTest >> urlsToTest [
	^ #('https://bitbucket.org/estebanlm/logger')
]
