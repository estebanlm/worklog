Class {
	#name : #CrTodoListPanel,
	#superclass : #SpPresenter,
	#instVars : [
		'list',
		'actionBar',
		'todoList'
	],
	#category : #'Crono-Spec-View-Todo'
}

{ #category : #specs }
CrTodoListPanel class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #list;
		add: #actionBar expand: false;
		yourself
]

{ #category : #initialization }
CrTodoListPanel >> addGlobalShortcutsTo: aWindowPresenter [

	aWindowPresenter 
		bindKey: $n 
		toAction: [ self addNewToDo ]
]

{ #category : #actions }
CrTodoListPanel >> addNewToDo [

	(CrTodoItemPresenter newApplication: self application)
		todoList: self todoList;
		onAdd: [ :todo | 
			list items: self newListItemPresenters.
			list selectItem: todo ];
		openDialogWithSpec
]

{ #category : #initialization }
CrTodoListPanel >> defineInputPorts [
	
	^ { SpModelPort new }
]

{ #category : #initialization }
CrTodoListPanel >> defineOutputPorts [ 

	^ list defineOutputPorts 
		collect: [ :each |
			each copy 
				delegate: [ list ];
				yourself ]
]

{ #category : #accessing }
CrTodoListPanel >> firstResponder [

	^ list
]

{ #category : #initialization }
CrTodoListPanel >> initializePresenters [

	list := self newComponentList.
	actionBar := self newActionBar
		add: (self newButton 
			label: 'New To-Do';
			action: [ self addNewToDo ];
			yourself);
		yourself
]

{ #category : #'private factory' }
CrTodoListPanel >> newListItemPresenters [
	
	^ self todoList items
		collect: [ :each | 
			(self instantiate: CrTodoListItemPanel on: each)
				todoList: self todoList;
				yourself ]
]

{ #category : #accessing }
CrTodoListPanel >> refresh [
	| selectedItem |

	selectedItem := list selection selectedItem ifNotNil: #item.
	list items: self newListItemPresenters.
	selectedItem ifNotNil: [ 
		self selectItem: selectedItem ]
]

{ #category : #accessing }
CrTodoListPanel >> selectItem: aListItem [

	list items 
		detect: [ :each | each item = aListItem ]
		ifFound: [ :each | list selectItem: each ]
		ifNone: [ list unselectAll ]
]

{ #category : #'accessing model' }
CrTodoListPanel >> setModel: aTodoList [

	self todoList: aTodoList
]

{ #category : #accessing }
CrTodoListPanel >> todoList [

	^ todoList
]

{ #category : #accessing }
CrTodoListPanel >> todoList: aList [

	todoList := aList.
	self refresh
]