Class {
	#name : #CrCronoDialog,
	#superclass : #CrCronoPresenter,
	#instVars : [
		'logText'
	],
	#category : #'Crono-Spec-View'
}

{ #category : #specs }
CrCronoDialog class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #logText;
		yourself
]

{ #category : #'instance creation' }
CrCronoDialog class >> open [
	<script>
	
	^ self new openDialogWithSpec
]

{ #category : #actions }
CrCronoDialog >> addCrono [

	self newCrono log: logText text asString
]

{ #category : #initialization }
CrCronoDialog >> initializeDialogWindow: aWindowDialogPresenter [

	aWindowDialogPresenter 
		addButton: 'Cancel' do: [ :presenter | presenter beCancel; close ];
		addButton: ('Crono' " format: { KMShortcutPrinter toString: Character cr alt }")
		do: [ :presenter |
			self addCrono.
			presenter beOk; close ];
		centered
]

{ #category : #initialization }
CrCronoDialog >> initializePresenters [

	logText := self newText
		placeholder: 'Enter your crono log entry';
		addStyle: 'cronoText';
			bindKeyCombination: Character cr alt toAction: [ 
			self addCrono.
			self window close ];
		yourself.
		
	logText takeKeyboardFocus
]

{ #category : #initialization }
CrCronoDialog >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'Crono';
		initialExtent: 500@150
]

{ #category : #'private factory' }
CrCronoDialog >> newCrono [

	^ CrCrono new
]
