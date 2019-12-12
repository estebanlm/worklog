Class {
	#name : #CrTodoListIndexSummaryPanel,
	#superclass : #SpPresenter,
	#instVars : [
		'todoList',
		'iconImage',
		'nameLabel',
		'statusPresenter'
	],
	#category : #'Crono-View-Todo'
}

{ #category : #specs }
CrTodoListIndexSummaryPanel class >> defaultSpec [

	^ SpBoxLayout newHorizontal
		"borderWidth: 3;"
		spacing: 5;
		add: #iconImage expand: false;
		add: #nameLabel;
		addLast: #statusPresenter expand: false;
		yourself
]

{ #category : #accessing }
CrTodoListIndexSummaryPanel >> completionImage [

	^ CrCompletionBuilder new 
		completion: self todoList completion;
		build
]

{ #category : #initialization }
CrTodoListIndexSummaryPanel >> image [
		
	^ self todoList iconName 
		ifNotNil: [ :iconName | self application iconNamed: iconName ]
]

{ #category : #initialization }
CrTodoListIndexSummaryPanel >> initializePresenters [

	iconImage := self newImage image: self image.
	nameLabel := self newLabel label: self todoList name.
	
	statusPresenter := self newStatusPresenter.
	self updateStatusPresenter
]

{ #category : #private }
CrTodoListIndexSummaryPanel >> newStatusPresenter [

	self showsCompletion ifTrue: [ ^ self newImage ].
	^ self newLabel
]

{ #category : #accessing }
CrTodoListIndexSummaryPanel >> refresh [

	self updateStatusPresenter
]

{ #category : #initialization }
CrTodoListIndexSummaryPanel >> setModelBeforeInitialization: aTodoList [

	todoList := aTodoList
]

{ #category : #accessing }
CrTodoListIndexSummaryPanel >> showsCompletion [

	^ self todoList showsCompletion
]

{ #category : #accessing }
CrTodoListIndexSummaryPanel >> showsPendingSize [

	^ self todoList showsPendingSize
]

{ #category : #accessing }
CrTodoListIndexSummaryPanel >> statusString [

	todoList pendingTasksSize isZero ifTrue: [ ^ '' ].
	^ '{1}/{2}' format: { 
			self todoList doneTasksSize. 
			self todoList tasksSize }
]

{ #category : #accessing }
CrTodoListIndexSummaryPanel >> todoList [

	^ todoList
]

{ #category : #accessing }
CrTodoListIndexSummaryPanel >> todoListPendingSize [

	^ self todoList pendingTasksSize
]

{ #category : #private }
CrTodoListIndexSummaryPanel >> updateStatusPresenter [

	self showsCompletion ifTrue: [ ^ statusPresenter image: self completionImage ].
	self showsPendingSize ifTrue: [ | listSize | 
		listSize := self todoListPendingSize.
		statusPresenter label: (listSize ~= 0 
			ifTrue: [ listSize printString ] 
			ifFalse: [ '' ]) ]
]
