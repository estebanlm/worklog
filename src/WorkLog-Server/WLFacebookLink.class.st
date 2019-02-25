"
I'm a facebook link.
"
Class {
	#name : #WLFacebookLink,
	#superclass : #WLHtmlLink,
	#category : 'WorkLog-Server-Model-Link'
}

{ #category : #testing }
WLFacebookLink class >> isSuitableFor: aLink [
	^ aLink url asUrl host includesSubstring: 'facebook.com' 
]

{ #category : #accessing }
WLFacebookLink >> thumbnailUrl [ 
	^ WLStaticLibrary / #facebookPng
]

{ #category : #accessing }
WLFacebookLink >> title [
	^ 'Facebook'
]
