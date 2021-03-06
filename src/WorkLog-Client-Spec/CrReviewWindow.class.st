Class {
	#name : #CrReviewWindow,
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
CrReviewWindow class >> defaultSpec [

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
CrReviewWindow class >> open [
	<script>
	
	^ (self newApplication: CrApplication current) openWithSpec
]

{ #category : #private }
CrReviewWindow >> configuration [

	^ configuration ifNil: [ 
		configuration := CrReviewWindowConfiguration readFromFileSystem ]
]

{ #category : #actions }
CrReviewWindow >> copyToClipboard [

	Clipboard clipboardText: reportText text asString
]

{ #category : #private }
CrReviewWindow >> initialBounds [
		
	^ self configuration bounds
]

{ #category : #private }
CrReviewWindow >> initialDays [
		
	^ self configuration reviewDays
]

{ #category : #initialization }
CrReviewWindow >> initializePresenters [

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
CrReviewWindow >> initializeWindow: aWindowPresenter [
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
CrReviewWindow >> newCrono [

	^ WLCrono new
]

{ #category : #'private factory' }
CrReviewWindow >> newRangeTo: aNumber [

	^ WLCronoRange 
		newFrom: (Date today - (aNumber - 1) days) asDate 
		to: Date today
]

{ #category : #actions }
CrReviewWindow >> review [
	| days |

	days := daysInput number.
	reportText text: (String streamContents: [ :stream |
		self newCrono 
			review: (self newRangeTo: days)
			to: (ZnNewLineWriterStream on: stream) ]).
	self updateTitle		
]

{ #category : #actions }
CrReviewWindow >> review: aNumber [

	self withWindowDo: [ :w | w title: ('Review {1} days' format: { aNumber }) ].
	reportText text: (String streamContents: [ :stream |
		self newCrono 
			review: (self newRangeTo: aNumber)
			to: (ZnNewLineWriterStream on: stream) ])
]

{ #category : #private }
CrReviewWindow >> storeSettings [

	CrReviewWindowConfiguration readFromFileSystem
		bounds: self window window bounds;
		reviewDays: daysInput number;
		writeToFile
]

{ #category : #private }
CrReviewWindow >> updateTitle [
	| days |

	days := daysInput number.
	self withWindowDo: [ :w | 
		w title: ('Review last {1} day{2}' format: { 
			days. 
			days > 1 ifTrue: [ 's' ] ifFalse: [ '']}) ]
]

{ #category : #events }
CrReviewWindow >> windowWillClose [

	self storeSettings
]
