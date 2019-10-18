Class {
	#name : #CrLogDialog,
	#superclass : #CrCronoPresenter,
	#instVars : [
		'logText'
	],
	#category : #'Crono-Spec-View'
}

{ #category : #specs }
CrLogDialog class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #logText;
		yourself
]

{ #category : #'instance creation' }
CrLogDialog class >> open [
	<script>
	
	^ (self newApplication: CrApplication current) openDialogWithSpec
]

{ #category : #actions }
CrLogDialog >> addCrono [

	self newCrono log: logText text asString
]

{ #category : #initialization }
CrLogDialog >> initializeDialogWindow: aWindowDialogPresenter [

	aWindowDialogPresenter 
		addButton: 'Cancel' do: [ :presenter | presenter beCancel; close ];
		addButton: ('Log {1}' format: { KMShortcutPrinter toString: Character cr alt })
		do: [ :presenter |
			self addCrono.
			presenter beOk; close ];
		centered
]

{ #category : #initialization }
CrLogDialog >> initializePresenters [

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
CrLogDialog >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'Crono';
		initialExtent: 500@150
]

{ #category : #'private factory' }
CrLogDialog >> newCrono [

	^ CrCrono new
]
