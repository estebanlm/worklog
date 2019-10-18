Class {
	#name : #CrTodoItemPresenter,
	#superclass : #CrTodoPresenter,
	#instVars : [
		'nameTextInput',
		'notesText'
	],
	#category : #'Crono-Spec-View'
}

{ #category : #specs }
CrTodoItemPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical 
		add: #nameTextInput expand: false;
		add: #notesText;
		yourself
]

{ #category : #initialization }
CrTodoItemPresenter >> initializeDialogWindow: aWindowDialogPresenter [

	aWindowDialogPresenter 
		addButton: 'Cancel' do: [ :presenter | presenter beCancel; close ];
		addButton: 'To-Do'
		do: [ :presenter |
			self addTodo.
			presenter beOk; close ];
		centered
]

{ #category : #initialization }
CrTodoItemPresenter >> initializePresenters [

	nameTextInput := self newTextInput
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
