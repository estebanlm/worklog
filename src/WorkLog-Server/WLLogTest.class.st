Class {
	#name : #WLLogTest,
	#superclass : #TestCase,
	#category : 'WorkLog-Server-Tests'
}

{ #category : #tests }
WLLogTest >> testNew [
	| log |
	
	log := WLLog new.
	self assert: log text isNil.
	self assert: log date notNil.
	self assert: log date asDate equals: Date today.
]
