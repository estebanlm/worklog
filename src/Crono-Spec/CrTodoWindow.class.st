"
I'm a window to show all the todo lists, including the inbox and the active lists.
This is more or less like a GTD. 

"
Class {
	#name : #CrTodoWindow,
	#superclass : #CrTodoPresenter,
	#instVars : [
		'indexPanel',
		'listPanel',
		'toolbar',
		'searchField'
	],
	#category : #'Crono-Spec-View-Todo'
}

{ #category : #specs }
CrTodoWindow class >> defaultSpec [

	^ SpBoxLayout newVertical 
		add: (SpBoxLayout newHorizontal
				spacing: 5; 
				add: #toolbar;
				addLast: #searchField expand: false;
				yourself)
			expand: false; 
		add: (SpPanedLayout newHorizontal
			position: 30 percent;
			add: #indexPanel;
			add: #listPanel;
			yourself);
		yourself
]

{ #category : #initialization }
CrTodoWindow >> addGlobalShortcutsTo: aWindowPresenter [

	aWindowPresenter 
		bindKeyCombination: $l command mac | $l control unix | $l control win
		toAction: [ searchField takeKeyboardFocus ]
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

	self initializeToolbar.	
	self initializeSearchField.
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
CrTodoWindow >> initializeSearchField [

	searchField := self newSearchInput
		help: 'Search...';
		yourself
]

{ #category : #initialization }
CrTodoWindow >> initializeToolbar [
	
	toolbar := self newToolBar.
	toolbar beIcons.
	toolbar fillWith: (CmCommandGroup forSpec
		register: (CmCommandGroup forSpec
			register: (CrTodoAddNewCommand forSpecContext: self);
			yourself);
		yourself)
]

{ #category : #initialization }
CrTodoWindow >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter
]

{ #category : #initialization }
CrTodoWindow >> title [ 

	^ 'ToDo'
]
