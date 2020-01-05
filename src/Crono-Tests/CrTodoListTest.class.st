Class {
	#name : #CrTodoListTest,
	#superclass : #CrTestCase,
	#category : #'Crono-Tests'
}

{ #category : #tests }
CrTodoListTest >> testSaveTask [
	| task |

	task := CrTodoTask new
		name: 'Test';
		notes: 'Test';
		done: false;
		yourself.

	(CrTodoList newName: 'Test List') saveTask: task.
		
	self 
		assert: CrTodoTask selectAll anyOne 
		equals: task.
	self 
		assert: (CrTodoList listNamed: 'Test List') tasks anyOne 
		equals: task
]
