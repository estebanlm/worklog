"
I'm a window to show all the todo lists, including the inbox and the active lists.
This is more or less like a GTD. 

"
Class {
	#name : #CrTodoWindow,
	#superclass : #CrTodoPresenter,
	#instVars : [
		'listsActionBar',
		'listOfListsHeader',
		'indexPanel',
		'listPanel'
	],
	#category : #'Crono-Spec-View'
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
CrTodoWindow >> initializePresenters [

	indexPanel := self instantiate: CrSelectionablePanel.
	indexPanel panelNumber: 1.
	indexPanel title: 'Lists'.
	indexPanel instantiatePresenter: CrListIndexPanel.
	
	listPanel := self instantiate: CrSelectionablePanel.
	listPanel panelNumber: 2.
	listPanel instantiatePresenter: CrListPanel
]

{ #category : #initialization }
CrTodoWindow >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter
]

{ #category : #initialization }
CrTodoWindow >> title [ 

	^ 'ToDo'
]
