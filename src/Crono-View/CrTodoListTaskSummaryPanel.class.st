"
I am a panel to show a summary of a task.
Summary contains: title, completion, [project] and maybe other details.
"
Class {
	#name : #CrTodoListTaskSummaryPanel,
	#superclass : #SpPresenter,
	#instVars : [
		'todoList',
		'item',
		'doneCheckbox',
		'nameLabel'
	],
	#category : #'Crono-View-Todo'
}

{ #category : #specs }
CrTodoListTaskSummaryPanel class >> defaultSpec [

	^ SpBoxLayout newHorizontal
		add: #doneCheckbox expand: false;
		add: #nameLabel;
		yourself
]

{ #category : #initialization }
CrTodoListTaskSummaryPanel >> initializePresenters [

	doneCheckbox := self newCheckBox 
		state: item isDone;
		whenChangedDo: [ :state | self stateChangedTo: state ].
	nameLabel := self newLabel label: item name
]

{ #category : #accessing }
CrTodoListTaskSummaryPanel >> item [

	^ item
]

{ #category : #'accessing model' }
CrTodoListTaskSummaryPanel >> setModelBeforeInitialization: aListItem [

	item := aListItem
]

{ #category : #actions }
CrTodoListTaskSummaryPanel >> stateChangedTo: state [
	
	self item done: state.
	self todoList ifNotNil: #writeToFile
]

{ #category : #accessing }
CrTodoListTaskSummaryPanel >> todoList [
	^ todoList
]

{ #category : #accessing }
CrTodoListTaskSummaryPanel >> todoList: anObject [
	todoList := anObject
]
