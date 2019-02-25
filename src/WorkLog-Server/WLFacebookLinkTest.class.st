Class {
	#name : #WLFacebookLinkTest,
	#superclass : #WLExternalLinkTest,
	#category : 'WorkLog-Server-Tests'
}

{ #category : #accessing }
WLFacebookLinkTest >> linkClass [
	^ WLFacebookLink
]

{ #category : #accessing }
WLFacebookLinkTest >> urlsToTest [
	^ #('https://www.facebook.com/some/link')
]
