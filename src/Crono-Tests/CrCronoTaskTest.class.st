Class {
	#name : #CrCronoTaskTest,
	#superclass : #TestCase,
	#category : #'Crono-Tests'
}

{ #category : #tests }
CrCronoTaskTest >> testPrintInChangeLogFormat [
	| task changeLog |

	task := CrCronoTask new 
		notes: 'Test in changelog (one line).';
		yourself.
			
	changeLog := String streamContents: [ :stream |
		task printChangeLogOn: stream ].
	
	self assert: changeLog equals: '    * Test in changelog (one line).'
	
	
]

{ #category : #tests }
CrCronoTaskTest >> testSave [
	| task |

	task := CrCronoTask new 
		notes: 'Test';
		save.
		
	self assert: task isDone.
	self assert: task doneDate notNil.
	
	self assert: CrCronoTask selectAll anyOne equals: task
]

{ #category : #tests }
CrCronoTaskTest >> testSaveWithTags [
	| task |

	task := CrCronoTask new 
		notes: 'Test with [tag]';
		save.
		
	self assert: task isDone.
	self assert: task doneDate notNil.
	
	self assert: CrCronoTask selectAll anyOne equals: task.
	
	self assert: task tags equals: #('tag')
]
