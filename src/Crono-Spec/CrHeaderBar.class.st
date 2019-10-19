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
		add: #iconImage expand: false;
		add: #titleLabel expand: false;
		add: #shortcutLabel expand: false;
		yourself
		
]

{ #category : #initialization }
CrHeaderBar >> initializePresenters [

	iconImage := self newImage.
	titleLabel := self newLabel label: 'TODO'.
	shortcutLabel := self newLabel
]
