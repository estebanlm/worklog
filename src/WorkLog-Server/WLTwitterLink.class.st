"
I'm a twitter link.
"
Class {
	#name : #WLTwitterLink,
	#superclass : #WLHtmlLink,
	#category : 'WorkLog-Server-Model-Link'
}

{ #category : #testing }
WLTwitterLink class >> isSuitableFor: aLink [
	^ aLink url asUrl host includesSubstring: 'twitter.com' 
]

{ #category : #accessing }
WLTwitterLink >> thumbnailUrl [ 
	^ WLStaticLibrary / #twitterPng
]

{ #category : #accessing }
WLTwitterLink >> title [
	^ 'Twitter'
]
