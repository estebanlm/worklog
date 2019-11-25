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
CrTodoListIndexPanel >> addNewList [
]

{ #category : #initialization }
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

{ #category : #accessing }
CrTodoListIndexPanel >> firstResponder [

	^ list
]

{ #category : #initialization }
CrTodoListIndexPanel >> initializePresenters [

	list := self newComponentList
		presenters: self allListPresenters;
		selectIndex: 2;
		yourself.
	actionBar := self newActionBar
		add: (self newButton 
			"label: 'New List';"
			icon: (self application iconNamed: #grayAdd);
			help: 'New List';
			action: [ self addNewList ];
			yourself);
		yourself
]

{ #category : #accessing }
CrTodoListIndexPanel >> refreshSelection [

	self selectedItem ifNotNil: #refresh
]

{ #category : #accessing }
CrTodoListIndexPanel >> selectedItem [
	^ list selection selectedItem
]
