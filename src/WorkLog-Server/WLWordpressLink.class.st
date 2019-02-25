"
I'm a wordpress.com link.
"
Class {
	#name : #WLWordpressLink,
	#superclass : #WLHtmlLink,
	#category : 'WorkLog-Server-Model-Link'
}

{ #category : #testing }
WLWordpressLink class >> isSuitableFor: aLink [
	^ aLink url asUrl host includesSubstring: 'wordpress.com' 
]

{ #category : #accessing }
WLWordpressLink >> thumbnailUrl [ 
	^ WLStaticLibrary / #wordpressPng
]

{ #category : #accessing }
WLWordpressLink >> title [
	^ 'Wordpress'
]
