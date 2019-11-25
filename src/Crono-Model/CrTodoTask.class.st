Class {
	#name : #CrTodoTask,
	#superclass : #Object,
	#instVars : [
		'name',
		'notes',
		'doneDate'
	],
	#category : #'Crono-Model'
}

{ #category : #'ston-core' }
CrTodoTask class >> stonName [

	^ 'Task'
]

{ #category : #accessing }
CrTodoTask >> done: aBoolean [

	doneDate := aBoolean 
		ifTrue: [ Date today ]
		ifFalse: [ nil ]
]

{ #category : #accessing }
CrTodoTask >> doneDate [
	^ doneDate
]

{ #category : #testing }
CrTodoTask >> isDone [

	^ doneDate notNil
]

{ #category : #accessing }
CrTodoTask >> name [
	^ name
]

{ #category : #accessing }
CrTodoTask >> name: anObject [
	name := anObject
]

{ #category : #accessing }
CrTodoTask >> notes [
	^ notes
]

{ #category : #accessing }
CrTodoTask >> notes: anObject [
	notes := anObject
]
