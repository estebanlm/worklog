Class {
	#name : #WLMediumLinkTest,
	#superclass : #WLExternalLinkTest,
	#category : 'WorkLog-Server-Tests'
}

{ #category : #accessing }
WLMediumLinkTest >> linkClass [
	^ WLMediumLink
]

{ #category : #accessing }
WLMediumLinkTest >> urlsToTest [
	^ #('https://medium.com/concerning-pharo/pharo-beta-nine-59ee972d321a#.a4ogy85iu')
]
