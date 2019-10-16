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

	self crono log: logText text asString
]

{ #category : #accessing }
WLCronoDialog >> crono [

	^ WLCrono new
]

{ #category : #initialization }
WLCronoDialog >> initializeDialogWindow: aWindowDialogPresenter [

	aWindowDialogPresenter 
		addButton: 'Crono' do: [ :presenter |
			self addCrono.
			presenter beOk.
			presenter close ];
		centered
]

{ #category : #initialization }
WLCronoDialog >> initializePresenters [

	logText := self newRichText
		autoAccept: true;
		addStyle: 'cronoText';
		textStyler: SpNullTextStyler new;
		bindKeyCombination: Character cr alt toAction: [ 
			self addCrono.
			self window close ];
		yourself
]

{ #category : #initialization }
WLCronoDialog >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'Crono'
]
