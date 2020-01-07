Class {
	#name : #CrTodoListTest,
	#superclass : #CrTestCase,
	#category : #'Crono-Tests'
}

{ #category : #tests }
CrTodoListTest >> testMoveTaskTo [
	| task list1 list2 |

	task := CrTodoTask new
		name: 'Test';
		notes: 'Test';
		done: false;
		yourself.

	list1 := CrTodoList newName: 'List 1'.
	list2 := CrTodoList newName: 'List 2'.
	
	list1 saveTask: task.
	list1 moveTask: task to: list2.
		
	self assert: list1 tasks isEmpty.
	self assert: list2 tasks anyOne equals: task.
	self assert: CrTodoTask selectAll anyOne equals: task.
]

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
