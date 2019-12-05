Class {
	#name : #CrTodoTask,
	#superclass : #Object,
	#instVars : [
		'name',
		'notes',
		'startDate',
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
CrTodoTask class >> voyageDoneDate [
	<voyageDescription>
	
	^ VOToOneDescription new 
		attributeName: 'doneDate';
		accessor: (MAPluggableAccessor 
			read: [ :aTask | aTask doneDate ifNotNil: #asString ]
			write: [ :aTask :date | 
				date ifNotNil: [ aTask setDoneDate: (DateAndTime fromString: date) ] ]);
		yourself
]

{ #category : #persistence }
CrTodoTask class >> voyageRepository [

	^ CrApplication current repository
]

{ #category : #persistence }
CrTodoTask class >> voyageStartDate [
	<voyageDescription>
	
	^ VOToOneDescription new 
		attributeName: 'startDate';
		accessor: (MAPluggableAccessor 
			read: [ :aTask | aTask doneDate ifNotNil: #asString ]
			write: [ :aTask :date | 
				date ifNotNil: [ aTask setStartDate: (DateAndTime fromString: date) ] ]);
		yourself
]

{ #category : #accessing }
CrTodoTask >> done: aBoolean [

	doneDate := aBoolean 
		ifTrue: [ DateAndTime now ]
		ifFalse: [ nil ]
]

{ #category : #accessing }
CrTodoTask >> doneDate [
	^ doneDate
]

{ #category : #testing }
CrTodoTask >> hasNotes [

	^ self notes isEmptyOrNil not
]

{ #category : #initialization }
CrTodoTask >> initialize [

	super initialize. 
	startDate := DateAndTime now
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

{ #category : #printing }
CrTodoTask >> printOn: stream [

	super printOn: stream.
	stream << '(' << self name << ')'
]

{ #category : #private }
CrTodoTask >> setDoneDate: aDateAndTime [
	
	doneDate := aDateAndTime
]

{ #category : #private }
CrTodoTask >> setStartDate: aDateAndTime [
	
	doneDate := aDateAndTime
]

{ #category : #accessing }
CrTodoTask >> startDate [

	^ startDate
]
