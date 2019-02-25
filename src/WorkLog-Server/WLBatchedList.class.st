Class {
	#name : #WLBatchedList,
	#superclass : #TBSBatchedList,
	#category : 'WorkLog-Server-View'
}

{ #category : #rendering }
WLBatchedList >> renderContentOn: html [
	self maxPages = 1 ifTrue: [ ^ self ].
	super renderContentOn: html
]
