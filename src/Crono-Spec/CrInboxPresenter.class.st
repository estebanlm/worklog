Class {
	#name : #CrInboxPresenter,
	#superclass : #CrTodoPresenter,
	#category : #'Crono-Spec-View'
}

{ #category : #specs }
CrInboxPresenter class >> defaultSpec [

	^ SpPanedLayout newHorizontal
		position: 30 percent;
		add: #listOfLists;
		add: #list;
		yourself
]
