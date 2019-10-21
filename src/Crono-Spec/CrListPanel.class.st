Class {
	#name : #CrListPanel,
	#superclass : #SpPresenter,
	#instVars : [
		'list',
		'actionBar',
		'todoList'
	],
	#category : #'Crono-Spec-View-Todo'
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

	(CrTodoItemPresenter newApplication: self application)
		todoList: self todoList;
		onAdd: [ :todo | 
			list items: self newListItemPresenters.
			list selectItem: todo ];
		openDialogWithSpec
]

{ #category : #initialization }
CrListPanel >> defineInputPorts [
	
	^ { SpModelPort new }
]

{ #category : #initialization }
CrListPanel >> defineOutputPorts [ 

	^ list defineOutputPorts 
		collect: [ :each |
			each copy 
				delegate: [ list ];
				yourself ]
]

{ #category : #accessing }
CrListPanel >> firstResponder [

	^ list
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

{ #category : #'private factory' }
CrListPanel >> newListItemPresenters [
	
	^ self todoList items
		collect: [ :each | self instantiate: CrListItemPanel on: each ]
]

{ #category : #accessing }
CrListPanel >> refresh [
	| selectedItem |

	selectedItem := list selection selectedItem ifNotNil: #item.
	list items: self newListItemPresenters.
	selectedItem ifNotNil: [ 
		self selectItem: selectedItem ]
]

{ #category : #accessing }
CrListPanel >> selectItem: aListItem [

	list items 
		detect: [ :each | each item = aListItem ]
		ifFound: [ :each | list selectItem: each ]
		ifNone: [ list unselectAll ]
]

{ #category : #'accessing model' }
CrListPanel >> setModel: aTodoList [

	self todoList: aTodoList
]

{ #category : #accessing }
CrListPanel >> todoList [

	^ todoList
]

{ #category : #accessing }
CrListPanel >> todoList: aList [

	todoList := aList.
	self refresh
]
