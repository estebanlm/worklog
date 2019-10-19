Class {
	#name : #CrTodoWindow,
	#superclass : #CrTodoPresenter,
	#instVars : [
		'listOfLists',
		'list',
		'listsActionBar'
	],
	#category : #'Crono-Spec-View'
}

{ #category : #specs }
CrTodoWindow class >> defaultSpec [

	^ SpPanedLayout newHorizontal
		position: 30 percent;
		add: (SpBoxLayout newVertical 
			add: #listOfLists;
			addLast: #listsActionBar expand: false;
			yourself);
		add: #list;
		yourself
]

{ #category : #actions }
CrTodoWindow >> addNewList [
]

{ #category : #accessing }
CrTodoWindow >> allLists [

	^ CrTodoList allLists
]

{ #category : #private }
CrTodoWindow >> configurationClass [

	^ CrTodoWindowConfiguration
]

{ #category : #initialization }
CrTodoWindow >> initializePresenters [

	listOfLists := self newList
		items: self allLists;
		display: #name;
		yourself.
	listsActionBar := self newActionBar
		add: (self newButton 
			label: 'New List';
			action: [ self addNewList ];
			yourself);
		yourself.
	
	list := self newList
]

{ #category : #initialization }
CrTodoWindow >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter
]

{ #category : #initialization }
CrTodoWindow >> title [ 

	^ 'ToDo'
]
