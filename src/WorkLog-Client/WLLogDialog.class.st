Class {
	#name : #WLLogDialog,
	#superclass : #ComposableModel,
	#instVars : [
		'textArea',
		'acceptButton'
	],
	#category : 'WorkLog-Client-GUI'
}

{ #category : #specs }
WLLogDialog class >> defaultSpec [
	<spec>
	
	^ SpecLayout composed 
		newColumn: [ :column |
			column 
				newRow: #textArea;
				newRow: #acceptButton height: 35 ];
		yourself
]

{ #category : #actions }
WLLogDialog >> accept [ 
	self textArea accept.
	[ 
		self client add: self textArea text asString.
		self window close ]
	on: Error do: [ :e | self alert: 'Error: ', e messageText ]
	
]

{ #category : #accessing }
WLLogDialog >> acceptButton [
	^ acceptButton
]

{ #category : #accessing }
WLLogDialog >> acceptButton: anObject [
	acceptButton := anObject
]

{ #category : #initialization }
WLLogDialog >> initializeWidgets [
	textArea := self newText.
	acceptButton := self newButton.
	
	acceptButton 
		label: 'Accept';
		action: [ self accept ].
]

{ #category : #accessing }
WLLogDialog >> textArea [
	^ textArea
]

{ #category : #accessing }
WLLogDialog >> textArea: anObject [
	textArea := anObject
]

{ #category : #accessing }
WLLogDialog >> title [
	^ 'Log'
]
