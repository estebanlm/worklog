"
I am a panel to show a list of tasks.

"
Class {
	#name : #CrTodoListPanel,
	#superclass : #SpPresenter,
	#instVars : [
		'list',
		'statusBar',
		'actionBar',
		'todoList',
		'shownArchived'
	],
	#category : #'Crono-View-Todo'
}

{ #category : #specs }
CrTodoListPanel class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #list;
		add: #actionBar expand: false;
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

{ #category : #actions }
CrTodoListPanel >> archiveCompletedTasks [

	self todoList archiveCompletedTasks.
	self refresh
]

{ #category : #private }
CrTodoListPanel >> autoArchiveAfterDays [

	^ self application settings autoArchiveAfterDays
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
		register: (CrTodoTaskMoveCommand forSpecContext: self);
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
	self initializeSubscribers.
	shownArchived := false
]

{ #category : #initialization }
CrTodoListPanel >> initializePresenters [

	(list := self newComponentList)
		addStyle: 'list';
		contextMenu: self contextMenu;
		contextKeyBindings: self contextMenuKeyBindings;
		bindKeyCombination: Character space asKeyCombination 
			toAction: [ self selectedItemToggleState ];
		whenActivatedDo: [ self editTask ].
		
	statusBar := self instantiate: CrTodoListStatusBarPanel.
	actionBar := self newActionBar
		add: statusBar;
		addLast: (self newToggleButton
			icon: (self application iconNamed: #actionShow);
			whenChangedDo: [ self toggleShownArchived ];
			yourself);
		addLast: (self newButton
			icon: (self application iconNamed: #actionTrash);
			help: 'Archive completed tasks now';
			action: [ self archiveCompletedTasks ];
			yourself);
		yourself.
]

{ #category : #initialization }
CrTodoListPanel >> initializeSubscribers [

	self application notificationCenter 
		subscribe: self to: CrTaskNotification;
		subscribe: self to: CrListChangedNotification
]

{ #category : #'private factory' }
CrTodoListPanel >> newTaskPresenters [
	
	^ self todoList tasks
		collect: [ :each | 
			self 
				instantiate: CrTodoListTaskSummaryPanel 
				on: (CrTodoListAndTaskPair
					newList: self todoList 
					task: each) ]
]

{ #category : #'private factory' }
CrTodoListPanel >> newTaskPresentersFor: aCollection [
	
	^ aCollection collect: [ :each | 
		self 
			instantiate: CrTodoListTaskSummaryPanel 
			on: (CrTodoListAndTaskPair
				newList: self todoList 
				task: each) ]
]

{ #category : #'notification handling' }
CrTodoListPanel >> noteListChanged: aNotification [

	self todoList = aNotification list ifFalse: [ ^ self ].
	self refresh
]

{ #category : #'notification handling' }
CrTodoListPanel >> noteTaskAdded: aNotification [

	(self todoList includesTask: aNotification task) ifFalse: [ ^ self ].
	
	list items: self newTaskPresenters.
	self selectItem: aNotification task.
	list takeKeyboardFocus
]

{ #category : #'notification handling' }
CrTodoListPanel >> noteTaskChanged: aNotification [
	"Someone changed this list from another place"

	list presenters
		detect: [ :each | each task = aNotification task ]
		ifFound: [ :aPresenter | 
			aPresenter refreshContentIfNeeded.
			statusBar refresh ].

	
]

{ #category : #accessing }
CrTodoListPanel >> refresh [
	| selectedItem tasks |

	selectedItem := list selection selectedItem ifNotNil: #task.
	tasks := self visibleTasksInRightOrder.
	list items: (self newTaskPresentersFor: tasks).
	selectedItem ifNotNil: [ 
		self selectItem: selectedItem ].
	statusBar refresh
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

{ #category : #testing }
CrTodoListPanel >> shownArchived [

	^ shownArchived
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

{ #category : #actions }
CrTodoListPanel >> toggleShownArchived [

	shownArchived := shownArchived not.
	self refresh
]

{ #category : #private }
CrTodoListPanel >> visibleTasksInRightOrder [
	| tasks |
	
	tasks := self todoList tasks.
	self flag: #TODO. "This will be todoList directly once we introduce a cache system for tasks
	(now is like this to avoid double query"
	tasks do: [ :each | each archiveIfDoneAfterDays: self autoArchiveAfterDays ].
	self shownArchived ifFalse: [ ^ tasks reject: #isArchived ].
	
	tasks := tasks groupedBy: #isArchived.
	^ (tasks at: false ifAbsent: [ #() ]), 
	  (tasks at: true ifAbsent: [ #() ])
]
