"
I'm a smalltalkhub.com link 
"
Class {
	#name : #WLSmalltalkHubLink,
	#superclass : #WLHtmlLink,
	#category : 'WorkLog-Server-Model-Link'
}

{ #category : #testing }
WLSmalltalkHubLink class >> isSuitableFor: aLink [
	^ aLink url asUrl host includesSubstring: 'smalltalkhub.com' 
]

{ #category : #accessing }
WLSmalltalkHubLink >> thumbnailUrl [ 
	^ WLStaticLibrary / #smalltalkhubPng
]

{ #category : #accessing }
WLSmalltalkHubLink >> title [
	^ 'SmalltalkHub'
]
