Class {
	#name : #CrTodoAddTaskPanel,
	#superclass : #CrTodoTaskPanel,
	#category : #'Crono-View-Todo'
}

{ #category : #actions }
CrTodoAddTaskPanel >> addTaskThen: aBlock [
	| task |

	self validate ifFalse: [ ^ self ].

	task := CrTodoTask new
		name: nameTextInput text asString trimmed;
		notes: notesText text asString trimmed;
		done: doneCheckbox state;
		yourself.
	
	self todoList 
		addTask: task;
		save.
	
	self application notificationCenter 
		notify: (CrTaskAddedNotification newTask: task);
		notify: (CrListChangedNotification newList: self todoList).

	aBlock value
]

{ #category : #initialization }
CrTodoAddTaskPanel >> initializeDialogWindow: aWindowDialogPresenter [

	aWindowDialogPresenter 
		addButton: 'Cancel' do: [ :presenter | presenter beCancel; close ];
		addButton: 'Add'
			do: [ :presenter |
				self addTaskThen: [ 
					presenter 
						beOk; 
						close ] ];
		centered
]
