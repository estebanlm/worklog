"
I'm a github link.
"
Class {
	#name : #WLGithubLink,
	#superclass : #WLHtmlLink,
	#category : 'WorkLog-Server-Model-Link'
}

{ #category : #testing }
WLGithubLink class >> isSuitableFor: aLink [
	^ aLink url asUrl host includesSubstring: 'github.com' 
]

{ #category : #accessing }
WLGithubLink >> thumbnailUrl [ 
	^ WLStaticLibrary / #githubPng
]

{ #category : #accessing }
WLGithubLink >> title [
	^ 'GitHub'
]
