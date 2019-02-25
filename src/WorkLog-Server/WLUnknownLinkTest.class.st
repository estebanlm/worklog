Class {
	#name : #WLUnknownLinkTest,
	#superclass : #WLExternalLinkTest,
	#category : 'WorkLog-Server-Tests'
}

{ #category : #accessing }
WLUnknownLinkTest >> linkClass [
	^ WLUnknownLink
]

{ #category : #accessing }
WLUnknownLinkTest >> urlsToTest [
	^ #('https://www.google.fr/?gfe_rd=cr&ei=ONCLVrGcJozu8weqq6iQBA&gws_rd=ssl')
]
