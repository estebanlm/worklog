"
I am a panel to show a summary of a task.
Summary contains: title, completion, [project] and maybe other details.
"
Class {
	#name : #CrTodoListTaskSummaryPanel,
	#superclass : #SpPresenter,
	#instVars : [
		'todoList',
		'doneCheckbox',
		'nameLabel',
		'task',
		'noteMarkerImage',
		'memento'
	],
	#category : #'Crono-View-Todo'
}

{ #category : #specs }
CrTodoListTaskSummaryPanel class >> defaultSpec [

	^ SpBoxLayout newHorizontal
		add: #doneCheckbox expand: false;
		add: #nameLabel;
		addLast: #noteMarkerImage expand: false;
		yourself
]

{ #category : #actions }
CrTodoListTaskSummaryPanel >> focusChangedTo: focus [
	
	self task 
		focus: focus;
		save.
		
	self application notificationCenter 
		notify: (CrTaskChangedNotification newTask: self task);
		notify: (CrListChangedNotification newList: CrTodoList active)
]

{ #category : #initialization }
CrTodoListTaskSummaryPanel >> initializePresenters [

	doneCheckbox := self newCheckBox 
		whenChangedDo: [ :state | self stateChangedTo: state ].
	nameLabel := self newLabel.
	noteMarkerImage := self newImage.

	self updatePresenter
]

{ #category : #accessing }
CrTodoListTaskSummaryPanel >> refreshContentIfNeeded [
	| newMemento |

	newMemento := self task takeMemento.
	memento = newMemento ifTrue: [ ^ self ].

	memento := newMemento.
	self updatePresenter
]

{ #category : #'accessing model' }
CrTodoListTaskSummaryPanel >> setModelBeforeInitialization: aTask [

	task := aTask.
	memento := aTask takeMemento.
]

{ #category : #actions }
CrTodoListTaskSummaryPanel >> stateChangedTo: state [
	
	self task isDone = state ifTrue: [ ^ self ].
	
	self task 
		done: state;
		save.
		
	self application notificationCenter notify: (CrTaskChangedNotification newTask: self task)
]

{ #category : #accessing }
CrTodoListTaskSummaryPanel >> task [

	^ task
]

{ #category : #accessing }
CrTodoListTaskSummaryPanel >> todoList [
	^ todoList
]

{ #category : #accessing }
CrTodoListTaskSummaryPanel >> todoList: anObject [
	todoList := anObject
]

{ #category : #actions }
CrTodoListTaskSummaryPanel >> toggleFocus [

	self focusChangedTo: self task isFocused not
]

{ #category : #actions }
CrTodoListTaskSummaryPanel >> toggleState [

	doneCheckbox state: doneCheckbox state not
]

{ #category : #initialization }
CrTodoListTaskSummaryPanel >> updatePresenter [

	doneCheckbox state: task isDone.
	nameLabel label: task name.
	task hasNotes 
		ifTrue: [ noteMarkerImage image: (self application iconNamed: #markNote) ]
		ifFalse: [ noteMarkerImage image: nil ]
]
