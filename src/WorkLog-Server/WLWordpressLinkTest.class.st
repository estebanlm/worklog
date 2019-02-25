Class {
	#name : #WLWordpressLinkTest,
	#superclass : #WLExternalLinkTest,
	#category : 'WorkLog-Server-Tests'
}

{ #category : #accessing }
WLWordpressLinkTest >> linkClass [
	^ WLWordpressLink
]

{ #category : #accessing }
WLWordpressLinkTest >> urlsToTest [
	^ #('https://eloctavoclan.wordpress.com/2011/09/04/tu-rostro/')
]
