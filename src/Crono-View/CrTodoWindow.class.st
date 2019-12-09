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
	#category : #'Crono-View-Todo'
}

{ #category : #specs }
CrTodoWindow class >> defaultSpec [

	^ SpBoxLayout newVertical 
		add: (SpBoxLayout newHorizontal
				spacing: 5; 
				add: #toolbar;
				addLast: (SpBoxLayout newVertical 
					add: #searchField 
						expand: false 
						fill: false 
						padding: 5;
					yourself) 
					expand: false;
				yourself)
			expand: false; 
		add: (SpPanedLayout newHorizontal
			position: 30 percent;
			add: #indexPanel;
			add: #listPanel;
			yourself);
		yourself
]

{ #category : #accessing }
CrTodoWindow >> activeTodoList [

	^ listPanel presenter activeTodoList
]

{ #category : #initialization }
CrTodoWindow >> addGlobalShortcutsTo: aWindowPresenter [

	aWindowPresenter 
		bindKey: $l toAction: [ searchField takeKeyboardFocus ];
		bindKeysWith: self allKeyBindingActions
]

{ #category : #private }
CrTodoWindow >> allKeyBindingActions [

	^ CmCommandGroup forSpec
		register: (CrTodoAddNewCronoCommand forSpecContext: self);
		register: (CrTodoReviewCronoCommand forSpecContext: self);
		register: (CrTodoAddTaskCommand forSpecContext: self);
		register: (CrTodoAddListCommand forSpecContext: self);
		yourself
]

{ #category : #private }
CrTodoWindow >> configurationClass [

	^ CrTodoWindowConfiguration
]

{ #category : #initialization }
CrTodoWindow >> doTransmitList: aTodoList [

	aTodoList ifNil: [ ^ self ].
	listPanel presenter todoList = aTodoList ifTrue: [ ^ self ].
	 
	listPanel 
		image: (self application iconNamed: aTodoList iconName);
		title: aTodoList name. 
	listPanel presenter todoList: aTodoList
]

{ #category : #initialization }
CrTodoWindow >> initialize [

	super initialize.
	self initializeSubscribers
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
			self doTransmitList: aTodoList ]
		transform: [ :aSummaryPresenter | 
			aSummaryPresenter ifNotNil: #todoList ]
]

{ #category : #initialization }
CrTodoWindow >> initializeSearchField [

	searchField := self newSearchInput
		help: 'Search...';
		yourself
]

{ #category : #initialization }
CrTodoWindow >> initializeSubscribers [

	self application notificationCenter 
		subscribe: self to: CrTaskNotification
]

{ #category : #initialization }
CrTodoWindow >> initializeToolbar [
	
	toolbar := self newToolBar.
	toolbar beIcons.
	toolbar fillWith: self toolbarActions
]

{ #category : #initialization }
CrTodoWindow >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter whenOpenedDo: [
		indexPanel firstResponder takeKeyboardFocus ]
]

{ #category : #'notification handling' }
CrTodoWindow >> noteTask: aNotification [
 
	"A task has changed. I need to refresh it"
	indexPanel presenter refreshSelection
]

{ #category : #'notification handling' }
CrTodoWindow >> noteTaskAdded: aNotification [ 
	
	self noteTask: aNotification
]

{ #category : #'notification handling' }
CrTodoWindow >> noteTaskChanged: aNotification [ 
	
	self noteTask: aNotification
]

{ #category : #'notification handling' }
CrTodoWindow >> noteTaskRemoved: aNotification [ 
	
	self noteTask: aNotification
]

{ #category : #initialization }
CrTodoWindow >> title [ 

	^ 'Lists'
]

{ #category : #private }
CrTodoWindow >> toolbarActions [

	^ CmCommandGroup forSpec
		register: (CrTodoAddNewCronoCommand forSpecContext: self);
		register: (CrTodoAddTaskCommand forSpecContext: self);
		register: (CrTodoReviewCronoCommand forSpecContext: self);
		yourself
]
