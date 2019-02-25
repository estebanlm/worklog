Class {
	#name : #WLSmalltalkHubLinkTest,
	#superclass : #WLExternalLinkTest,
	#category : 'WorkLog-Server-Tests'
}

{ #category : #accessing }
WLSmalltalkHubLinkTest >> linkClass [
	^ WLSmalltalkHubLink
]

{ #category : #accessing }
WLSmalltalkHubLinkTest >> urlsToTest [
	^ #('http://smalltalkhub.com/#!/~estebanlm/Voyage')
]
