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
		'noteMarkerImage'
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

{ #category : #initialization }
CrTodoListTaskSummaryPanel >> initializePresenters [

	doneCheckbox := self newCheckBox 
		state: task isDone;
		whenChangedDo: [ :state | self stateChangedTo: state ].
	nameLabel := self newLabel label: task name.
	noteMarkerImage := self newImage
]

{ #category : #'accessing model' }
CrTodoListTaskSummaryPanel >> setModelBeforeInitialization: aTask [

	task := aTask
]

{ #category : #actions }
CrTodoListTaskSummaryPanel >> stateChangedTo: state [
	
	self task 
		done: state;
		save
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
CrTodoListTaskSummaryPanel >> toggleState [

	doneCheckbox state: doneCheckbox state not
]
