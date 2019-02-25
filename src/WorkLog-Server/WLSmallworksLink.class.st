"
I'm a smallworks.eu link (my own site :P)
"
Class {
	#name : #WLSmallworksLink,
	#superclass : #WLHtmlLink,
	#category : 'WorkLog-Server-Model-Link'
}

{ #category : #testing }
WLSmallworksLink class >> isSuitableFor: aLink [
	^ aLink url asUrl host includesSubstring: 'smallworks.eu' 
]

{ #category : #accessing }
WLSmallworksLink >> thumbnailUrl [ 
	^ WLStaticLibrary / #smallworksPng
]

{ #category : #accessing }
WLSmallworksLink >> title [
	^ 'Smallworks'
]
