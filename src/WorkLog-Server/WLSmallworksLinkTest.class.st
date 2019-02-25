Class {
	#name : #WLSmallworksLinkTest,
	#superclass : #WLExternalLinkTest,
	#category : 'WorkLog-Server-Tests'
}

{ #category : #accessing }
WLSmallworksLinkTest >> linkClass [
	^ WLSmallworksLink
]

{ #category : #accessing }
WLSmallworksLinkTest >> urlsToTest [
	^ #('http://smallworks.eu/web/blog/2015-07-02-fast-table-for-pharo')
]
