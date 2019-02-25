"
I'm a generic html link.
"
Class {
	#name : #WLHtmlLink,
	#superclass : #WLExternalLink,
	#category : 'WorkLog-Server-Model-Link'
}

{ #category : #testing }
WLHtmlLink class >> isSuitableFor: aLink [
	"Is abstract, so it always answer false"
	^ false 
]
