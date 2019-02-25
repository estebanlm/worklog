Class {
	#name : #WLGithubLinkTest,
	#superclass : #WLExternalLinkTest,
	#category : 'WorkLog-Server-Tests'
}

{ #category : #accessing }
WLGithubLinkTest >> linkClass [
	^ WLGithubLink
]

{ #category : #accessing }
WLGithubLinkTest >> urlsToTest [
	^ #('https://github.com/estebanlm/worklog')
]
