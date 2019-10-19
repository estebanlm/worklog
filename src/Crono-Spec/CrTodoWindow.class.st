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
	indexPanel number: 1.
	indexPanel title: 'Lists'.
	indexPanel instantiatePresenter: CrListIndexPanel.
	
	listPanel := self instantiate: CrSelectionablePanel.
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
