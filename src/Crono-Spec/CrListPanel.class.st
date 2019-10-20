Class {
	#name : #CrListPanel,
	#superclass : #SpPresenter,
	#instVars : [
		'list',
		'actionBar',
		'todoList'
	],
	#category : #'Crono-Spec-View'
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
		onAdd: [ :todo | 
			list items: todoList items.
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

{ #category : #accessing }
CrListPanel >> refresh [
	| selectedItem |
	selectedItem := list selection selectedItem.
	list items: self todoList items.
	selectedItem ifNotNil: [ list selectItem: selectedItem ]
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
