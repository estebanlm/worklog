"
I'm a fogbugz link.
"
Class {
	#name : #WLFogbugzLink,
	#superclass : #WLHtmlLink,
	#category : 'WorkLog-Server-Model-Link'
}

{ #category : #testing }
WLFogbugzLink class >> isSuitableFor: aLink [
	^ (aLink reference beginsWith: 'case:')
		or: [ aLink url asUrl host includesSubstring: 'fogbugz.com' ] 
]

{ #category : #'instance creation' }
WLFogbugzLink class >> link: aLink [ 
	^ self basicNew 
		initializeLink: aLink;
		yourself
]

{ #category : #accessing }
WLFogbugzLink >> thumbnailUrl [ 
	^ WLStaticLibrary / #fogbugzPng
]

{ #category : #accessing }
WLFogbugzLink >> title [
	^ 'Fogbugz'
]
