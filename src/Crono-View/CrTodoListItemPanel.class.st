Class {
	#name : #CrTodoListItemPanel,
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
CrTodoListItemPanel class >> defaultSpec [

	^ SpBoxLayout newHorizontal
		add: #doneCheckbox expand: false;
		add: #nameLabel;
		yourself
]

{ #category : #initialization }
CrTodoListItemPanel >> initializePresenters [

	doneCheckbox := self newCheckBox 
		state: item isDone;
		whenChangedDo: [ :state | self stateChangedTo: state ].
	nameLabel := self newLabel label: item name
]

{ #category : #accessing }
CrTodoListItemPanel >> item [

	^ item
]

{ #category : #'accessing model' }
CrTodoListItemPanel >> setModelBeforeInitialization: aListItem [

	item := aListItem
]

{ #category : #actions }
CrTodoListItemPanel >> stateChangedTo: state [
	
	self item done: state.
	self todoList ifNotNil: #writeToFile
]

{ #category : #accessing }
CrTodoListItemPanel >> todoList [
	^ todoList
]

{ #category : #accessing }
CrTodoListItemPanel >> todoList: anObject [
	todoList := anObject
]
