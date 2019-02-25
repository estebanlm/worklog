"
I'm a bitbucket link.
"
Class {
	#name : #WLBitbucketLink,
	#superclass : #WLHtmlLink,
	#category : 'WorkLog-Server-Model-Link'
}

{ #category : #testing }
WLBitbucketLink class >> isSuitableFor: aLink [
	^ aLink url asUrl host includesSubstring: 'bitbucket.org' 
]

{ #category : #accessing }
WLBitbucketLink >> thumbnailUrl [ 
	^ WLStaticLibrary / #bitbucketPng
]

{ #category : #accessing }
WLBitbucketLink >> title [
	^ 'Bitbucket'
]
