Class {
	#name : #CrTodoListIndexSummaryPanel,
	#superclass : #SpPresenter,
	#instVars : [
		'iconImage',
		'nameLabel',
		'statusLabel',
		'todoList'
	],
	#category : #'Crono-Spec-View-Todo'
}

{ #category : #specs }
CrTodoListIndexSummaryPanel class >> defaultSpec [

	^ SpBoxLayout newHorizontal
		add: #iconImage expand: false;
		add: #nameLabel;
		addLast: #statusLabel expand: false;
		yourself
]

{ #category : #initialization }
CrTodoListIndexSummaryPanel >> initializePresenters [

	iconImage := self newImage.
	nameLabel := self newLabel label: self todoList name.
	statusLabel := self newLabel
]

{ #category : #initialization }
CrTodoListIndexSummaryPanel >> setModelBeforeInitialization: aTodoList [

	todoList := aTodoList
]

{ #category : #accessing }
CrTodoListIndexSummaryPanel >> todoList [

	^ todoList
]
