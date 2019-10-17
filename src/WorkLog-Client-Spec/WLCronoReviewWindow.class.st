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
				add: #daysInput expand: false;
				add: #refreshButton expand: false;
				yourself)
			expand: false;
		add: #reportText;
		yourself
]

{ #category : #'instance creation' }
WLCronoReviewWindow class >> open [
	<script>
	
	^ (self newApplication: WLCronoApplication current) openWithSpec
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

{ #category : #initialization }
WLCronoReviewWindow >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'Crono review';
		initialExtent: 720@700
]

{ #category : #'private factory' }
WLCronoReviewWindow >> newCrono [

	^ WLCrono new
]

{ #category : #'private factory' }
WLCronoReviewWindow >> newRangeTo: aNumber [

	^ WLCronoRange 
		newFrom: (Date today - (aNumber - 1) days) asDate 
		to: Date today
]

{ #category : #actions }
WLCronoReviewWindow >> review: aNumber [

	self withWindowDo: [ :w | w title: ('Review {1} days' format: { aNumber }) ].
	reportText text: (String streamContents: [ :stream |
		self newCrono 
			review: (self newRangeTo: aNumber)
			to: (ZnNewLineWriterStream on: stream) ])
]
