Class {
	#name : #CrListPanel,
	#superclass : #SpPresenter,
	#instVars : [
		'list',
		'actionBar'
	],
	#category : #'Crono-Spec-View'
}

{ #category : #specs }
CrListPanel class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #list;
		add: #actionBar expand: false;
		yourself
]

{ #category : #actions }
CrListPanel >> addNewToDo [

]

{ #category : #initialization }
CrListPanel >> initializePresenters [

	list := self newComponentList.
	actionBar := self newActionBar
		add: (self newButton 
			label: 'New To-Do';
			action: [ self addNewToDo ];
			yourself);
		yourself
]
