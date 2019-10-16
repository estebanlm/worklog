Class {
	#name : #WLCronoDialog,
	#superclass : #SpPresenter,
	#instVars : [
		'logText'
	],
	#category : #'WorkLog-Client-Spec'
}

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
		addStyle: 'crono-text';
		textStyler: SpNullTextStyler new;
		yourself.
]

{ #category : #initialization }
WLCronoDialog >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'Crono'
]
