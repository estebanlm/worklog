"
I am a panel to show an item content.
I can be shown as dialog or as part of another component.

I show a task title, description, completion and maybe other details.
"
Class {
	#name : #CrTodoTaskPanel,
	#superclass : #CrTodoPresenter,
	#instVars : [
		'nameTextInput',
		'notesText',
		'doneCheckbox',
		'todoList',
		'addAction'
	],
	#category : #'Crono-View-Todo'
}

{ #category : #specs }
CrTodoTaskPanel class >> defaultSpec [

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
CrTodoTaskPanel >> addTodoThen: aBlock [
	| item |

	self validate ifFalse: [ ^ self ].

	item := CrTodoTask new
		name: nameTextInput text asString trimmed;
		notes: notesText text asString trimmed;
		done: doneCheckbox state;
		yourself.
	
	self todoList 
		addItem: item;
		writeToFile.
	
	addAction ifNotNil: [ addAction cull: item ].
	aBlock value
]

{ #category : #initialization }
CrTodoTaskPanel >> initializeDialogWindow: aWindowDialogPresenter [

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
CrTodoTaskPanel >> initializePresenters [

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
CrTodoTaskPanel >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'To-Do';
		initialExtent: 500@150;
		whenOpenedDo: [ nameTextInput takeKeyboardFocus ]
]

{ #category : #events }
CrTodoTaskPanel >> onAdd: aBlock [

	addAction := aBlock
]

{ #category : #accessing }
CrTodoTaskPanel >> todoList [

	^ todoList
]

{ #category : #accessing }
CrTodoTaskPanel >> todoList: aList [

	^ todoList := aList
]

{ #category : #actions }
CrTodoTaskPanel >> validate [
	
	^ true
]