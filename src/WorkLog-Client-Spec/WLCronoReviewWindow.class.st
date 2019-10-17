Class {
	#name : #WLCronoReviewWindow,
	#superclass : #SpPresenter,
	#instVars : [
		'logText',
		'daysInput',
		'refreshButton',
		'reportText'
	],
	#category : #'WorkLog-Client-Spec'
}

{ #category : #specs }
WLCronoReviewWindow class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: (SpBoxLayout newHorizontal
			add: #daysInput;
			add: #refreshButton;
			yourself);
		add: #reportText;
		yourself
]

{ #category : #'instance creation' }
WLCronoReviewWindow class >> open [
	<script>
	
	^ (self newApplication: WLCronoApplication current) openWithSpec
]

{ #category : #accessing }
WLCronoReviewWindow >> crono [

	^ WLCrono new
]

{ #category : #initialization }
WLCronoReviewWindow >> initializePresenters [

	daysInput := self newNumberInput number: 1.
	refreshButton := self newButton 
		label: 'Review';
		action: [ self review: daysInput number ];
		yourself.
	reportText := self newText 
		addStyle: 'cronoText';
		yourself.
]

{ #category : #actions }
WLCronoReviewWindow >> review: aNumber [

	reportText text: (String streamContents: [ :stream |
		self crono 
			review: aNumber
			to: stream ])
]
