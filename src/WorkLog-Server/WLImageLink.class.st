"
I'm an image link.
"
Class {
	#name : #WLImageLink,
	#superclass : #WLExternalLink,
	#category : 'WorkLog-Server-Model-Link'
}

{ #category : #testing }
WLImageLink class >> isSuitableFor: aLink [
	| contentType |
	
	contentType := (ZnClient new 
		url: aLink reference;
		head;
		response)
		contentType.
		
	^ contentType main = 'image'
]

{ #category : #accessing }
WLImageLink >> title [
	^ 'Image'
]
