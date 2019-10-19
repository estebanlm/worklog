Class {
	#name : #CrHeaderBar,
	#superclass : #SpPresenter,
	#instVars : [
		'iconImage',
		'titleLabel',
		'shortcutLabel'
	],
	#category : #'Crono-Spec-View'
}

{ #category : #specs }
CrHeaderBar class >> defaultSpec [

	^ SpBoxLayout newHorizontal
		spacing: 5;
		add: #iconImage expand: false;
		add: #titleLabel expand: false;
		add: #shortcutLabel expand: false;
		yourself
		
]

{ #category : #initialization }
CrHeaderBar >> initializePresenters [

	iconImage := self newImage.
	titleLabel := self newLabel 
		addStyle: 'title';
		label: 'TODO'.
	shortcutLabel := self newLabel
		addStyle: 'titleShortcut'
]

{ #category : #accessing }
CrHeaderBar >> shortcut: aShortcut [

	shortcutLabel label: (KMShortcutPrinter toString: aShortcut)
]

{ #category : #accessing }
CrHeaderBar >> title: aString [

	titleLabel label: aString
]
