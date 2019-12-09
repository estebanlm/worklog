Class {
	#name : #CrTodoTask,
	#superclass : #Object,
	#instVars : [
		'name',
		'notes',
		'startDate',
		'doneDate',
		'tags'
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

{ #category : #private }
CrTodoTask >> collectTagsOn: aString [

	^ #()
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
CrTodoTask >> name: aString [

	name := aString
]

{ #category : #accessing }
CrTodoTask >> notes [
	^ notes
]

{ #category : #accessing }
CrTodoTask >> notes: aString [

	notes := aString
]

{ #category : #printing }
CrTodoTask >> printOn: stream [

	super printOn: stream.
	stream << '(' << self name << ')'
]

{ #category : #persistence }
CrTodoTask >> save [ 

	self updateTags.
	super save
]

{ #category : #private }
CrTodoTask >> setDoneDate: aDateAndTime [
	
	doneDate := aDateAndTime
]

{ #category : #private }
CrTodoTask >> setStartDate: aDateAndTime [
	
	startDate := aDateAndTime
]

{ #category : #accessing }
CrTodoTask >> startDate [

	^ startDate
]

{ #category : #accessing }
CrTodoTask >> takeMemento [

	^ self class allSlots 
		collect: [ :each | (self readSlot: each) copy ]
		as: Array
]

{ #category : #private }
CrTodoTask >> updateTags [
	
	tags := (self collectTagsOn: self name), (self collectTagsOn: self notes)

]
