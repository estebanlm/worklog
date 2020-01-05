Class {
	#name : #CrTodoTask,
	#superclass : #Object,
	#instVars : [
		'name',
		'notes',
		'startDate',
		'doneDate',
		'tags',
		'focused',
		'archived'
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
				date ifNotNil: [ aTask setDoneDate: (ZTimestamp fromString: date) ] ]);
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
			read: [ :aTask | aTask startDate ifNotNil: #asString ]
			write: [ :aTask :date | 
				date ifNotNil: [ aTask setStartDate: (ZTimestamp fromString: date) ] ]);
		yourself
]

{ #category : #actions }
CrTodoTask >> archive [

	self isArchived ifTrue: [ ^ self ].
	self archived: true.
	self focus: false.
	self save
]

{ #category : #actions }
CrTodoTask >> archiveIfDone [

	self archiveIfDoneAfterDays: 0
	
]

{ #category : #actions }
CrTodoTask >> archiveIfDoneAfterDays: daysNumber [

	self isArchived ifTrue: [ ^ self ].
	self isDone ifFalse: [ ^ self ].
	(self doneDate < (ZTimestamp now - daysNumber days)) ifFalse: [ ^ self ].
	
	self archived: true.
	self focus: false.
	self save
]

{ #category : #accessing }
CrTodoTask >> archived: aBoolean [

	archived := aBoolean
]

{ #category : #actions }
CrTodoTask >> changeFocusTo: aBoolean [

	self focus: aBoolean.
	self save
]

{ #category : #actions }
CrTodoTask >> changeStatusTo: aBoolean [

	self done: aBoolean.
	self save
]

{ #category : #private }
CrTodoTask >> collectTagsOn: aString [

	^ #()
]

{ #category : #accessing }
CrTodoTask >> done: aBoolean [

	doneDate := aBoolean 
		ifTrue: [ ZTimestamp now ]
		ifFalse: [ nil ]
]

{ #category : #accessing }
CrTodoTask >> doneDate [
	^ doneDate
]

{ #category : #accessing }
CrTodoTask >> focus: aBoolean [

	focused := aBoolean
]

{ #category : #testing }
CrTodoTask >> hasNotes [

	^ self notes isEmptyOrNil not
]

{ #category : #initialization }
CrTodoTask >> initialize [

	super initialize. 
	startDate := ZTimestamp now.
	focused := false.
	archived := false
]

{ #category : #testing }
CrTodoTask >> isArchived [

	^ archived
]

{ #category : #testing }
CrTodoTask >> isDone [

	^ doneDate notNil
]

{ #category : #accessing }
CrTodoTask >> isFocused [

	^ focused
]

{ #category : #testing }
CrTodoTask >> isVisible [

	^ self isArchived not 
		and: [ self isDone not or: [ self isStillShown: self doneDate ] ]
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

{ #category : #actions }
CrTodoTask >> toggleFocus [
	
	self changeFocusTo: self isFocused not
]

{ #category : #actions }
CrTodoTask >> unarchive [

	self isArchived ifFalse: [ ^ self ].
	self archived: false.
	self save
]

{ #category : #private }
CrTodoTask >> updateTags [
	
	tags := (self collectTagsOn: self name), (self collectTagsOn: self notes)

]
