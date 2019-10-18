Class {
	#name : #CrTodoWindow,
	#superclass : #CrTodoPresenter,
	#instVars : [
		'listOfLists',
		'list'
	],
	#category : #'Crono-Spec-View'
}

{ #category : #specs }
CrTodoWindow class >> defaultSpec [

	^ SpPanedLayout newHorizontal
		position: 30 percent;
		add: #listOfLists;
		add: #list;
		yourself
]

{ #category : #accessing }
CrTodoWindow >> configurationClass [

	^ CrTodoWindowConfiguration
]

{ #category : #initialization }
CrTodoWindow >> initializePresenters [

	listOfLists := self newList.
	list := self newList
]
