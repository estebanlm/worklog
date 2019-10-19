Class {
	#name : #CrSelectionablePanel,
	#superclass : #SpPresenter,
	#instVars : [
		'headerBar',
		'presenter'
	],
	#category : #'Crono-Spec-View'
}

{ #category : #specs }
CrSelectionablePanel class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #headerBar expand: false fill: false padding: 5;
		add: #presenter;
		yourself
]

{ #category : #initialization }
CrSelectionablePanel >> defineInputPorts [ 
	
	^ self presenter defineInputPorts
		collect: [ :each | 
			each copy 
				delegateTo: [ self presenter ];
				yourself ]
]

{ #category : #initialization }
CrSelectionablePanel >> defineOutputPorts [ 
	
	^ self presenter defineOutputPorts
		collect: [ :each | 
			each copy 
				delegateTo: [ self presenter ];
				yourself ]
]

{ #category : #initialization }
CrSelectionablePanel >> initializePresenters [

	headerBar := self instantiate: CrHeaderBar
]

{ #category : #'as yet unclassified' }
CrSelectionablePanel >> instantiatePresenter: aPresenterClass [ 

	presenter := self instantiate: aPresenterClass
]

{ #category : #'as yet unclassified' }
CrSelectionablePanel >> instantiatePresenter: aPresenterClass on: aModel [

	presenter := self 
		instantiate: aPresenterClass
		on: aModel
]

{ #category : #accessing }
CrSelectionablePanel >> number: aNumber [

	
]

{ #category : #accessing }
CrSelectionablePanel >> presenter [

	^ presenter
]

{ #category : #accessing }
CrSelectionablePanel >> title: aString [

	headerBar title: aString
]
