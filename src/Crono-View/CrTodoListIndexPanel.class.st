Class {
	#name : #CrTodoListIndexPanel,
	#superclass : #SpPresenter,
	#instVars : [
		'list',
		'actionBar'
	],
	#category : #'Crono-View-Todo'
}

{ #category : #specs }
CrTodoListIndexPanel class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #list;
		add: #actionBar expand: false;
		yourself
]

{ #category : #actions }
CrTodoListIndexPanel >> addList [

	(CrTodoAddListCommand forSpecContext: self) execute
]

{ #category : #private }
CrTodoListIndexPanel >> allListPresenters [
		
	^ self allLists collect: [ :each | self instantiate: CrTodoListIndexSummaryPanel on: each  ]
]

{ #category : #accessing }
CrTodoListIndexPanel >> allLists [

	^ CrTodoList allLists
]

{ #category : #initialization }
CrTodoListIndexPanel >> defineInputPorts [

	^ list defineInputPorts
		collect: [ :each |
			each copy 
				delegateTo: [ list ];
				yourself ]
]

{ #category : #initialization }
CrTodoListIndexPanel >> defineOutputPorts [ 

	^ list defineOutputPorts 
		collect: [ :each |
			each copy 
				delegateTo: [ list ];
				yourself ]
]

{ #category : #actions }
CrTodoListIndexPanel >> editList [
	| todoList |

	todoList := self selectedItem todoList.
	todoList isEditable ifFalse: [ ^ self ].

	(CrTodoEditListCommand forContext: self) 
		list: todoList;
		execute
]

{ #category : #accessing }
CrTodoListIndexPanel >> firstResponder [

	^ list
]

{ #category : #initialization }
CrTodoListIndexPanel >> initialize [

	super initialize.
	self initializeSubscribers
]

{ #category : #initialization }
CrTodoListIndexPanel >> initializePresenters [

	list := self newComponentList
		addStyle: 'list';
		presenters: self allListPresenters;
		selectIndex: 2;
		whenActivatedDo: [ self editList ];
		yourself.
		
	actionBar := self newActionBar
		add: (self newButton 
			"label: 'New List';"
			icon: (self application iconNamed: #grayAdd);
			help: 'New List';
			action: [ self addList ];
			yourself);
		yourself
]

{ #category : #initialization }
CrTodoListIndexPanel >> initializeSubscribers [

	self application notificationCenter
		subscribe: self to: CrListNotification
]

{ #category : #'notification handling' }
CrTodoListIndexPanel >> noteList: aNotification [

	self refreshThenSelect: aNotification list
]

{ #category : #'notification handling' }
CrTodoListIndexPanel >> noteListAdded: aNotification [

	self noteList: aNotification
]

{ #category : #'notification handling' }
CrTodoListIndexPanel >> noteListChanged: aNotification [

	self noteList: aNotification
]

{ #category : #accessing }
CrTodoListIndexPanel >> refresh [

	self refreshThenSelect: self selectedItem
]

{ #category : #accessing }
CrTodoListIndexPanel >> refreshSelection [

	self selectedItem ifNotNil: #refresh
]

{ #category : #accessing }
CrTodoListIndexPanel >> refreshThenSelect: aTodoList [

	list presenters: self allListPresenters.
	list selectItem: aTodoList
]

{ #category : #accessing }
CrTodoListIndexPanel >> selectedItem [

	^ list selection selectedItem
]
