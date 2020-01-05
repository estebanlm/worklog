Class {
	#name : #CrTestCase,
	#superclass : #TestCase,
	#category : #'Crono-Tests'
}

{ #category : #testing }
CrTestCase class >> isAbstract [

	^ self = CrTestCase
]

{ #category : #running }
CrTestCase >> runCase [
	| oldApplication |

	oldApplication := CrApplication current.
	CrApplication setCurrent: CrApplicationForTest new.
	[ super runCase ]
	ensure: [ 
		CrApplication setCurrent: oldApplication ]
]
