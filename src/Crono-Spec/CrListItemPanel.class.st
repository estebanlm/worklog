Class {
	#name : #CrListItemPanel,
	#superclass : #SpPresenter,
	#instVars : [
		'item',
		'doneCheckbox',
		'nameLabel'
	],
	#category : #'Crono-Spec-View-Todo'
}

{ #category : #specs }
CrListItemPanel class >> defaultSpec [

	^ SpBoxLayout newHorizontal
		add: #doneCheckbox expand: false;
		add: #nameLabel;
		yourself
]

{ #category : #initialization }
CrListItemPanel >> initializePresenters [

	doneCheckbox := self newCheckBox state: item isDone.
	nameLabel := self newLabel label: item name
]

{ #category : #accessing }
CrListItemPanel >> item [

	^ item
]

{ #category : #'accessing model' }
CrListItemPanel >> setModelBeforeInitialization: aListItem [

	item := aListItem
]
