"
I'm a medium.com link.
"
Class {
	#name : #WLMediumLink,
	#superclass : #WLHtmlLink,
	#category : 'WorkLog-Server-Model-Link'
}

{ #category : #testing }
WLMediumLink class >> isSuitableFor: aLink [
	^ aLink url asUrl host includesSubstring: 'medium.com' 
]

{ #category : #accessing }
WLMediumLink >> thumbnailUrl [ 
	^ WLStaticLibrary / #mediumPng
]

{ #category : #accessing }
WLMediumLink >> title [
	^ 'Medium'
]
