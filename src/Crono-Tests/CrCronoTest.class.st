Class {
	#name : #CrCronoTest,
	#superclass : #TestCase,
	#category : #'Crono-Tests'
}

{ #category : #'building suites' }
CrCronoTest class >> testParameters [

	^ super testParameters
		addCase: { #platform -> UnixPlatform new. #shortcut -> $n command. #result -> 'Cmd+N' };
		addCase: { #platform -> UnixPlatform new. #shortcut -> $n control. #result -> 'Ctrl+N' }
]

{ #category : #tests }
CrCronoTest >> testLog [ 

	self fail: 'TODO'
]

{ #category : #tests }
CrCronoTest >> testReviewTo [

	self fail: 'TODO'
]
