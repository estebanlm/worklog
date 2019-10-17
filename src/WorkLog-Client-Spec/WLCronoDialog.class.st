Class {
	#name : #WLCronoDialog,
	#superclass : #SpPresenter,
	#instVars : [
		'logText'
	],
	#category : #'WorkLog-Client-Spec'
}

{ #category : #specs }
WLCronoDialog class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #logText;
		yourself
]

{ #category : #'instance creation' }
WLCronoDialog class >> open [
	<script>
	
	^ (self newApplication: WLCronoApplication current) openDialogWithSpec
]

{ #category : #actions }
WLCronoDialog >> addCrono [

	self newCrono log: logText text asString
]

{ #category : #initialization }
WLCronoDialog >> initializeDialogWindow: aWindowDialogPresenter [

	aWindowDialogPresenter 
		addButton: 'Cancel' do: [ :presenter | presenter beCancel; close ];
		addButton: ('Log {1}' format: { KMShortcutPrinter toString: Character cr alt })
		do: [ :presenter |
			self addCrono.
			presenter beOk; close ];
		centered
]

{ #category : #initialization }
WLCronoDialog >> initializePresenters [

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
WLCronoDialog >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'Crono';
		initialExtent: 500@150
]

{ #category : #'private factory' }
WLCronoDialog >> newCrono [

	^ WLCrono new
]
