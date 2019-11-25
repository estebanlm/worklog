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

{ #category : #testing }
CrTodoTask class >> isVoyageRoot [

	^ true
]

{ #category : #'ston-core' }
CrTodoTask class >> stonName [

	^ 'Task'
]

{ #category : #persistence }
CrTodoTask class >> voyageCollectionName [

	^ 'tasks'
]

{ #category : #persistence }
CrTodoTask class >> voyageType [
	<voyageDescription>
	
	^ VOToOneDescription new 
		attributeName: 'doneDate';
		accessor: (MAPluggableAccessor 
			read: [ :aTask | aTask doneDate ifNotNil: #asString ]
			write: [ :aTask :date | 
				date ifNotNil: [ aTask setDoneDate: (DateAndTime fromString: date) ] ]);
		yourself
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

{ #category : #private }
CrTodoTask >> setDoneDate: aDateAndTime [
	
	doneDate := aDateAndTime
]
