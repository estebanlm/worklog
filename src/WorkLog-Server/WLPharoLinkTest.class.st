Class {
	#name : #WLPharoLinkTest,
	#superclass : #WLExternalLinkTest,
	#category : 'WorkLog-Server-Tests'
}

{ #category : #accessing }
WLPharoLinkTest >> linkClass [
	^ WLPharoLink
]

{ #category : #accessing }
WLPharoLinkTest >> urlsToTest [
	^ #('http://pharo.org/downloads' 
	'http://forum.world.st/Repeatable-VM-crash-td4794313.html'
	'http://lists.squeakfoundation.org/pipermail/vm-dev/2016-January/020437.html')
]
