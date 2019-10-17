Class {
	#name : #WLCronoReviewWindow,
	#superclass : #SpPresenter,
	#instVars : [
		'logText',
		'daysInput',
		'refreshButton',
		'reportText',
		'toolBar',
		'configuration'
	],
	#category : #'WorkLog-Client-Spec'
}

{ #category : #specs }
WLCronoReviewWindow class >> defaultSpec [

	^ SpBoxLayout newVertical
		spacing: 5;
		add: (SpBoxLayout newHorizontal
				spacing: 5;
				add: #daysInput expand: false;
				add: #refreshButton expand: false;
				addLast: #toolBar expand: false;
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

{ #category : #private }
WLCronoReviewWindow >> configuration [

	^ configuration ifNil: [ 
		configuration := WLCronoReviewWindowConfiguration readFromFileSystem ]
]

{ #category : #actions }
WLCronoReviewWindow >> copyToClipboard [

	Clipboard clipboardText: reportText text asString
]

{ #category : #private }
WLCronoReviewWindow >> initialBounds [
		
	^ self configuration bounds
]

{ #category : #private }
WLCronoReviewWindow >> initialDays [
		
	^ self configuration reviewDays
]

{ #category : #initialization }
WLCronoReviewWindow >> initializePresenters [

	daysInput := self newNumberInput 
		autoAccept: true;
		number: self initialDays.
	refreshButton := self newButton 
		label: 'Review';
		action: [ self review ];
		yourself.
	toolBar := self newToolBar
		beIcons;
		addItem: (SpToolBarButton new
			label: 'Copy';
			icon: (self iconNamed: #smallCopy);
			help: 'Copy to clipboard';
			action: [ self copyToClipboard ];
			yourself);
		yourself.
			
	reportText := self newText 
		addStyle: 'cronoText';
		enabled: false;
		yourself
]

{ #category : #initialization }
WLCronoReviewWindow >> initializeWindow: aWindowPresenter [
	| bounds |

	bounds := self initialBounds.
	aWindowPresenter 
		title: 'Crono review';
		initialPosition: bounds origin;
		initialExtent: bounds extent;
		whenBuiltDo: [ self review ];
		whenWillCloseDo: [ self storeSettings ]
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
WLCronoReviewWindow >> review [
	| days |

	days := daysInput number.
	reportText text: (String streamContents: [ :stream |
		self newCrono 
			review: (self newRangeTo: days)
			to: (ZnNewLineWriterStream on: stream) ]).
	self updateTitle		
]

{ #category : #actions }
WLCronoReviewWindow >> review: aNumber [

	self withWindowDo: [ :w | w title: ('Review {1} days' format: { aNumber }) ].
	reportText text: (String streamContents: [ :stream |
		self newCrono 
			review: (self newRangeTo: aNumber)
			to: (ZnNewLineWriterStream on: stream) ])
]

{ #category : #private }
WLCronoReviewWindow >> storeSettings [

	WLCronoReviewWindowConfiguration readFromFileSystem
		bounds: self window window bounds;
		reviewDays: daysInput number;
		writeToFile
]

{ #category : #private }
WLCronoReviewWindow >> updateTitle [
	| days |

	days := daysInput number.
	self withWindowDo: [ :w | 
		w title: ('Review last {1} day{2}' format: { 
			days. 
			days > 1 ifTrue: [ 's' ] ifFalse: [ '']}) ]
]

{ #category : #events }
WLCronoReviewWindow >> windowWillClose [

	self storeSettings
]
