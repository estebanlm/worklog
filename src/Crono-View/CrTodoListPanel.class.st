"
I am a panel to show a list of tasks.

"
Class {
	#name : #CrTodoListPanel,
	#superclass : #SpPresenter,
	#instVars : [
		'list',
		'actionBar',
		'todoList'
	],
	#category : #'Crono-View-Todo'
}

{ #category : #specs }
CrTodoListPanel class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #list;
		"add: #actionBar expand: false;"
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

	(CrTodoTaskPanel newApplication: self application)
		todoList: self todoList;
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
CrTodoListPanel >> initialize [

	super initialize.
	self application notificationCenter 
		subscribe: self to: CrTaskAddedNotification;
		subscribe: self to: CrTaskRemovedNotification
]

{ #category : #initialization }
CrTodoListPanel >> initializePresenters [

	(list := self newComponentList)
		addStyle: 'list';
		bindKeyCombination: Character space asKeyCombination 
		toAction: [ self selectedItemToggleState ]
]

{ #category : #'private factory' }
CrTodoListPanel >> newListItemPresenters [
	
	^ self todoList tasks
		collect: [ :each | 
			(self instantiate: CrTodoListTaskSummaryPanel on: each)
				todoList: self todoList;
				yourself ]
]

{ #category : #'notification handling' }
CrTodoListPanel >> noteTaskAdded: aNotification [

	(self todoList includesTask: aNotification task) ifFalse: [ ^ self ].
	
	list items: self newListItemPresenters.
	self selectItem: aNotification task.
	list takeKeyboardFocus
]

{ #category : #accessing }
CrTodoListPanel >> refresh [
	| selectedItem |

	selectedItem := list selection selectedItem ifNotNil: #task.
	list items: self newListItemPresenters.
	selectedItem ifNotNil: [ 
		self selectItem: selectedItem ]
]

{ #category : #accessing }
CrTodoListPanel >> selectItem: aListItem [

	list items 
		detect: [ :each | each task = aListItem ]
		ifFound: [ :each | list selectItem: each ]
		ifNone: [ list unselectAll ]
]

{ #category : #actions }
CrTodoListPanel >> selectedItemToggleState [

	list selection selectedItem ifNotNil: #toggleState
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
