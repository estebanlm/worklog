Class {
	#name : #CrCronoTask,
	#superclass : #Object,
	#instVars : [
		'doneDate',
		'notes',
		'tags'
	],
	#category : #'Crono-Model'
}

{ #category : #testing }
CrCronoTask class >> isVoyageRoot [

	^ true
]

{ #category : #persistence }
CrCronoTask class >> voyageCollectionName [
	"Sending to a per-year collection to optimise storage. 
	 Maybe unnecesary."
	
	^ 'crono-tasks-{1}' format: { Year current year }
]

{ #category : #persistence }
CrCronoTask class >> voyageDoneDate [
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
CrCronoTask class >> voyageRepository [

	^ CrApplication current repository
]

{ #category : #private }
CrCronoTask >> collectTagsOn: aString [

	^ #()
]

{ #category : #accessing }
CrCronoTask >> done: aBoolean [

	doneDate := aBoolean 
		ifTrue: [ DateAndTime now ]
		ifFalse: [ nil ]
]

{ #category : #accessing }
CrCronoTask >> doneDate [
	^ doneDate
]

{ #category : #testing }
CrCronoTask >> hasNotes [

	^ self notes isEmptyOrNil not
]

{ #category : #testing }
CrCronoTask >> isDone [

	^ doneDate notNil
]

{ #category : #accessing }
CrCronoTask >> notes [
	^ notes
]

{ #category : #accessing }
CrCronoTask >> notes: aString [

	notes := aString
]

{ #category : #printing }
CrCronoTask >> printOn: stream [ 
	
	stream << self notes
]

{ #category : #persistence }
CrCronoTask >> save [ 

	self updateTags.
	super save
]

{ #category : #private }
CrCronoTask >> setDoneDate: aDateAndTime [
	
	doneDate := aDateAndTime
]

{ #category : #private }
CrCronoTask >> updateTags [
	
	tags := self collectTagsOn: self notes
]
