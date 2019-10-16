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
		addStyle: 'cronoText';
		textStyler: SpNullTextStyler new;
		yourself.
]

{ #category : #initialization }
WLCronoDialog >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'Crono'
]
