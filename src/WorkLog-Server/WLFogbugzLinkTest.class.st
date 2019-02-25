Class {
	#name : #WLFogbugzLinkTest,
	#superclass : #WLExternalLinkTest,
	#category : 'WorkLog-Server-Tests'
}

{ #category : #accessing }
WLFogbugzLinkTest >> linkClass [
	^ WLFogbugzLink
]

{ #category : #accessing }
WLFogbugzLinkTest >> urlsToTest [
	^ #('case:12345' 'https://pharo.fogbugz.com/f/cases/17251')
]
