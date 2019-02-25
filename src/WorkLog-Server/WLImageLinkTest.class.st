Class {
	#name : #WLImageLinkTest,
	#superclass : #WLExternalLinkTest,
	#category : 'WorkLog-Server-Tests'
}

{ #category : #accessing }
WLImageLinkTest >> linkClass [
	^ WLImageLink
]

{ #category : #accessing }
WLImageLinkTest >> urlsToTest [
	^ #('https://upload.wikimedia.org/wikipedia/commons/1/1e/Large_Siamese_cat_tosses_a_mouse.jpg')
]
