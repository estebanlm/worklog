Class {
	#name : #WLYouTubeLinkTest,
	#superclass : #WLExternalLinkTest,
	#category : 'WorkLog-Server-Tests'
}

{ #category : #accessing }
WLYouTubeLinkTest >> linkClass [
	^ WLYouTubeLink
]

{ #category : #accessing }
WLYouTubeLinkTest >> urlsToTest [
	^ #('https://youtube.com/VIDEO')
]
