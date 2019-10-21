Class {
	#name : #CrListItemPanel,
	#superclass : #SpPresenter,
	#instVars : [
		'todoList',
		'item',
		'doneCheckbox',
		'nameLabel'
	],
	#category : #'Crono-Spec-View-Todo'
}

{ #category : #specs }
CrListItemPanel class >> defaultSpec [

	^ SpBoxLayout newHorizontal
		add: #doneCheckbox expand: false;
		add: #nameLabel;
		yourself
]

{ #category : #initialization }
CrListItemPanel >> initializePresenters [

	doneCheckbox := self newCheckBox 
		state: item isDone;
		whenChangedDo: [ :state | self stateChangedTo: state ].
	nameLabel := self newLabel label: item name
]

{ #category : #accessing }
CrListItemPanel >> item [

	^ item
]

{ #category : #'accessing model' }
CrListItemPanel >> setModelBeforeInitialization: aListItem [

	item := aListItem
]

{ #category : #actions }
CrListItemPanel >> stateChangedTo: state [
	
	self item done: state.
	self todoList ifNotNil: #writeToFile
]

{ #category : #accessing }
CrListItemPanel >> todoList [
	^ todoList
]

{ #category : #accessing }
CrListItemPanel >> todoList: anObject [
	todoList := anObject
]
