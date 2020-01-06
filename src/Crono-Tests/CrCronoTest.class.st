Class {
	#name : #CrCronoTest,
	#superclass : #CrTestCase,
	#category : #'Crono-Tests'
}

{ #category : #tests }
CrCronoTest >> testLog [ 

	self assert: CrCronoTask selectAll isEmpty.
	CrCronoLite new log: 'Test.'.
	self assert: CrCronoTask selectAll notEmpty
]

{ #category : #tests }
CrCronoTest >> testReviewTo [

	self fail: 'TODO'
]
