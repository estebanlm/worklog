"
I'm a window to show all the todo lists, including the inbox and the active lists.
This is more or less like a GTD. 

"
Class {
	#name : #CrTodoWindow,
	#superclass : #CrTodoPresenter,
	#instVars : [
		'indexPanel',
		'listPanel'
	],
	#category : #'Crono-Spec-View-Todo'
}

{ #category : #specs }
CrTodoWindow class >> defaultSpec [

	^ SpPanedLayout newHorizontal
		position: 30 percent;
		add: #indexPanel;
		add: #listPanel;
		yourself
]

{ #category : #private }
CrTodoWindow >> configurationClass [

	^ CrTodoWindowConfiguration
]

{ #category : #initialization }
CrTodoWindow >> initializeIndexPanel: aNumber [

	(indexPanel := self instantiate: CrSelectionablePanel)
		panelNumber: aNumber;
		title: 'Lists';
		instantiatePresenter: CrTodoListIndexPanel
	
]

{ #category : #initialization }
CrTodoWindow >> initializeListPanel: aNumber [
	| todoList |
	
	todoList := indexPanel presenter selectedItem todoList.
	(listPanel := self instantiate: CrSelectionablePanel)
		panelNumber: aNumber;
		title: todoList name;
		image: (self application iconNamed: todoList iconName);
		instantiatePresenter: CrTodoListPanel.
	listPanel presenter todoList: todoList
]

{ #category : #initialization }
CrTodoWindow >> initializePresenters [
	
	self initializeIndexPanel: 1.
	self initializeListPanel: 2.
	
	indexPanel presenter 
		transmitDo: [ :aTodoList |
			listPanel 
				image: (self application iconNamed: aTodoList iconName);
				title: aTodoList name. 
			listPanel presenter todoList: aTodoList ]
		transform: [ :aSummaryPresenter | aSummaryPresenter todoList ]
]

{ #category : #initialization }
CrTodoWindow >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter
]

{ #category : #initialization }
CrTodoWindow >> title [ 

	^ 'ToDo'
]