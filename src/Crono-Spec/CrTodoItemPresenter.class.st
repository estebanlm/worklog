Class {
	#name : #CrTodoItemPresenter,
	#superclass : #CrTodoPresenter,
	#instVars : [
		'nameTextInput',
		'notesText',
		'doneCheckbox',
		'todoList',
		'addAction'
	],
	#category : #'Crono-Spec-View-Todo'
}

{ #category : #specs }
CrTodoItemPresenter class >> defaultSpec [

	^ SpBoxLayout newHorizontal
		beNotHomogeneous;
		add: (SpBoxLayout newVertical
				add: #doneCheckbox expand: false fill: false padding: 4;
				yourself)
			expand: false;
		add: (SpBoxLayout newVertical
			add: #nameTextInput expand: false;
			add: #notesText;
			yourself);
		yourself
]

{ #category : #actions }
CrTodoItemPresenter >> addTodoThen: aBlock [
	| item |

	self validate ifFalse: [ ^ self ].

	item := CrTodoItem new
		name: nameTextInput text asString trimmed;
		notes: notesText text asString trimmed;
		yourself.
	doneCheckbox state ifTrue: [ item done ].
	self todoList 
		addItem: item;
		writeToFile.
	
	addAction ifNotNil: [ addAction cull: item ].
	aBlock value
]

{ #category : #initialization }
CrTodoItemPresenter >> initializeDialogWindow: aWindowDialogPresenter [

	aWindowDialogPresenter 
		addButton: 'Cancel' do: [ :presenter | presenter beCancel; close ];
		addButton: 'To-Do'
			do: [ :presenter |
				self addTodoThen: [ 
					presenter 
						beOk; 
						close ] ];
		centered
]

{ #category : #initialization }
CrTodoItemPresenter >> initializePresenters [

	doneCheckbox := self newCheckBox.
	nameTextInput := self newTextInput
		autoAccept: true;
		placeholder: 'New To-Do';
		yourself.
	notesText := self newText
		placeholder: 'Notes';
		yourself
]

{ #category : #initialization }
CrTodoItemPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'To-Do';
		initialExtent: 500@150;
		whenOpenedDo: [ nameTextInput takeKeyboardFocus ]
]

{ #category : #events }
CrTodoItemPresenter >> onAdd: aBlock [

	addAction := aBlock
]

{ #category : #accessing }
CrTodoItemPresenter >> todoList [

	^ todoList
]

{ #category : #accessing }
CrTodoItemPresenter >> todoList: aList [

	^ todoList := aList
]

{ #category : #actions }
CrTodoItemPresenter >> validate [
	
	^ true
]
