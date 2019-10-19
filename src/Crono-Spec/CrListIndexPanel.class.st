Class {
	#name : #CrListIndexPanel,
	#superclass : #SpPresenter,
	#instVars : [
		'list',
		'actionBar'
	],
	#category : #'Crono-Spec-View'
}

{ #category : #specs }
CrListIndexPanel class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #list;
		add: #actionBar;
		yourself
]

{ #category : #actions }
CrListIndexPanel >> addNewList [
]

{ #category : #accessing }
CrListIndexPanel >> allLists [

	^ CrTodoList allLists
]

{ #category : #initialization }
CrListIndexPanel >> initializePresenters [

	list := self newList
		items: self allLists;
		display: #name;
		selectIndex: 1;
		yourself.
	actionBar := self newActionBar
		add: (self newButton 
			label: 'New List';
			action: [ self addNewList ];
			yourself);
		yourself
]
