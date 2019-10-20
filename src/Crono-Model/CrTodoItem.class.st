Class {
	#name : #CrTodoItem,
	#superclass : #Object,
	#instVars : [
		'name',
		'notes',
		'doneDate'
	],
	#category : #'Crono-Model'
}

{ #category : #accessing }
CrTodoItem >> done [

	doneDate := Date today
]

{ #category : #accessing }
CrTodoItem >> doneDate [
	^ doneDate
]

{ #category : #testing }
CrTodoItem >> isDone [

	^ doneDate notNil
]

{ #category : #accessing }
CrTodoItem >> name [
	^ name
]

{ #category : #accessing }
CrTodoItem >> name: anObject [
	name := anObject
]

{ #category : #accessing }
CrTodoItem >> notes [
	^ notes
]

{ #category : #accessing }
CrTodoItem >> notes: anObject [
	notes := anObject
]
