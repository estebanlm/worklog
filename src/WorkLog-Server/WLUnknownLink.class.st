"
I'm an ""unknown"" link. I will be evaluated last (because I answer always true as ""suitable"")
"
Class {
	#name : #WLUnknownLink,
	#superclass : #WLHtmlLink,
	#category : 'WorkLog-Server-Model-Link'
}

{ #category : #testing }
WLUnknownLink class >> isSuitableFor: aLink [
	^ true
]

{ #category : #accessing }
WLUnknownLink class >> priority [
	^ 99 "last"
]

{ #category : #accessing }
WLUnknownLink >> thumbnailUrl [
	^ WLStaticLibrary / #linkPng
]

{ #category : #accessing }
WLUnknownLink >> title [
	^ 'Link'
]
