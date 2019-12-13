"
I am a panel to show a list of tasks.

"
Class {
	#name : #CrTodoListPanel,
	#superclass : #SpPresenter,
	#instVars : [
		'list',
		'statusBar',
		'todoList'
	],
	#category : #'Crono-View-Todo'
}

{ #category : #specs }
CrTodoListPanel class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #list;
		add: #statusBar expand: false;
		yourself
]

{ #category : #accessing }
CrTodoListPanel >> activeTask [

	^ list selection selectedItem task
]

{ #category : #accessing }
CrTodoListPanel >> activeTodoList [

	^ self todoList
]

{ #category : #initialization }
CrTodoListPanel >> addGlobalShortcutsTo: aWindowPresenter [

	aWindowPresenter 
		bindKey: $n 
		toAction: [ self addTask ]
]

{ #category : #actions }
CrTodoListPanel >> addTask [

	(CrTodoAddTaskCommand forContext: self) execute
]

{ #category : #private }
CrTodoListPanel >> contextMenu [

	^ self contextMenuActions asMenuPresenter
]

{ #category : #private }
CrTodoListPanel >> contextMenuActions [

	^ CmCommandGroup forSpec
		beRoot;
		register: (CrTodoTaskFocusCommand forSpecContext: self);
		register: (CrTodoTaskMoveToCommand forSpecContext: self);
		yourself
]

{ #category : #private }
CrTodoListPanel >> contextMenuKeyBindings [

	^ self contextMenuActions asKMCategory
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

{ #category : #actions }
CrTodoListPanel >> editTask [

	(CrTodoEditTaskCommand forContext: self) execute
]

{ #category : #accessing }
CrTodoListPanel >> firstResponder [

	^ list
]

{ #category : #initialization }
CrTodoListPanel >> initialize [

	super initialize.
	self initializeSubscribers
]

{ #category : #initialization }
CrTodoListPanel >> initializePresenters [

	(list := self newComponentList)
		addStyle: 'list';
		contextMenu: self contextMenu;
		"contextKeyBindings: self contextMenuKeyBindings;"
		bindKeyCombination: Character space asKeyCombination 
			toAction: [ self selectedItemToggleState ];
		whenActivatedDo: [ self editTask ].
		
	statusBar := self instantiate: CrTodoListStatusBarPanel
]

{ #category : #initialization }
CrTodoListPanel >> initializeSubscribers [

	self application notificationCenter 
		subscribe: self to: CrTaskNotification;
		subscribe: self to: CrListChangedNotification
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
CrTodoListPanel >> noteListChanged: aNotification [

	self todoList = aNotification list ifFalse: [ ^ self ].
	self refresh
]

{ #category : #'notification handling' }
CrTodoListPanel >> noteTaskAdded: aNotification [

	(self todoList includesTask: aNotification task) ifFalse: [ ^ self ].
	
	list items: self newListItemPresenters.
	self selectItem: aNotification task.
	list takeKeyboardFocus
]

{ #category : #'notification handling' }
CrTodoListPanel >> noteTaskChanged: aNotification [
	"Someone changed this list from another place"

	"Ok, is not this window the origin, but I am not editing this list eider"
	(self todoList includesTask: aNotification task) ifFalse: [ ^ self ].
	
	list presenters
		detect: [ :each | each task = aNotification task ]
		ifFound: [ :aPresenter | aPresenter refreshContentIfNeeded ] 
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
CrTodoListPanel >> selectedItemToggleFocus [

	list selection selectedItem ifNotNil: #toggleFocus
]

{ #category : #actions }
CrTodoListPanel >> selectedItemToggleState [

	list selection selectedItem ifNotNil: #toggleState
]

{ #category : #private }
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
	statusBar todoList: aList.
	self refresh
]
