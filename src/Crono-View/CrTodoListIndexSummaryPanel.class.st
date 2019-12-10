Class {
	#name : #CrTodoListIndexSummaryPanel,
	#superclass : #SpPresenter,
	#instVars : [
		'todoList',
		'iconImage',
		'nameLabel',
		'completionImage'
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
		addLast: #completionImage expand: false;
		yourself
]

{ #category : #accessing }
CrTodoListIndexSummaryPanel >> completionForm [

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

	iconImage := self newImage
		image: self image.
	nameLabel := self newLabel label: self todoList name.
	completionImage := self newImage image: self completionForm.
	
]

{ #category : #accessing }
CrTodoListIndexSummaryPanel >> refresh [

	completionImage image: self completionForm
]

{ #category : #initialization }
CrTodoListIndexSummaryPanel >> setModelBeforeInitialization: aTodoList [

	todoList := aTodoList
]

{ #category : #accessing }
CrTodoListIndexSummaryPanel >> statusString [

	todoList numberPendingTasks isZero ifTrue: [ ^ '' ].
	^ '{1}/{2}' format: { 
			self todoList numberDoneTasks. 
			self todoList numberTasks }
]

{ #category : #accessing }
CrTodoListIndexSummaryPanel >> todoList [

	^ todoList
]
