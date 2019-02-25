"
I'm a stackoverflow link.
"
Class {
	#name : #WLStackoverflowLink,
	#superclass : #WLHtmlLink,
	#category : 'WorkLog-Server-Model-Link'
}

{ #category : #testing }
WLStackoverflowLink class >> isSuitableFor: aLink [
	^ aLink url asUrl host includesSubstring: 'stackoverflow.com' 
]

{ #category : #accessing }
WLStackoverflowLink >> thumbnailUrl [ 
	^ WLStaticLibrary / #stackoverflowPng
]

{ #category : #accessing }
WLStackoverflowLink >> title [
	^ 'StackOverflow'
]
