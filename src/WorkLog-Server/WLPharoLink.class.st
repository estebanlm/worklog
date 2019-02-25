"
I'm a pharo.org link.
"
Class {
	#name : #WLPharoLink,
	#superclass : #WLHtmlLink,
	#category : 'WorkLog-Server-Model-Link'
}

{ #category : #testing }
WLPharoLink class >> isSuitableFor: aLink [
	| host |
	host := aLink url asUrl host.
	^ (host includesSubstring: 'pharo.org')
		"Technically this is not a pharo link... 
		 but well, this is easiest :)"
		or: [ (host includesSubstring: 'squeakfoundation.org') 
		or: [ host includesSubstring: 'world.st']]
]

{ #category : #accessing }
WLPharoLink >> thumbnailUrl [ 
	^ WLStaticLibrary / #pharoPng
]

{ #category : #accessing }
WLPharoLink >> title [
	^ 'Pharo'
]
