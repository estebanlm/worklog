Class {
	#name : #CrTodoListIndexSummaryPanel,
	#superclass : #SpPresenter,
	#instVars : [
		'iconImage',
		'nameLabel',
		'statusLabel',
		'todoList'
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
		addLast: #statusLabel expand: false;
		yourself
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
	statusLabel := self newLabel 
		addStyle: 'dim';
		label: self statusString
]

{ #category : #accessing }
CrTodoListIndexSummaryPanel >> refresh [

	statusLabel label: self statusString
]

{ #category : #initialization }
CrTodoListIndexSummaryPanel >> setModelBeforeInitialization: aTodoList [

	todoList := aTodoList
]

{ #category : #accessing }
CrTodoListIndexSummaryPanel >> statusString [

	todoList numberPendingItems isZero ifTrue: [ ^ '' ].
	^ '{1}/{2}' format: { 
			self todoList numberDoneItems. 
			self todoList numberItems }
]

{ #category : #accessing }
CrTodoListIndexSummaryPanel >> todoList [

	^ todoList
]
