"
I'm a list type.
"
Class {
	#name : #CrTodoType,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Crono-Model'
}

{ #category : #accessing }
CrTodoType class >> active [

	^ CrTodoTypeActive uniqueInstance
]

{ #category : #accessing }
CrTodoType class >> allTypes [

	^ CrTodoType allSubclasses collect: #uniqueInstance
]

{ #category : #'instance creation' }
CrTodoType class >> fromSton: stonReader [
	| typeName |
	
	typeName := stonReader parseListSingleton.
	^ self allTypes detect: [ :each | each name = typeName ]
]

{ #category : #accessing }
CrTodoType class >> inbox [

	^ CrTodoTypeInbox uniqueInstance
]

{ #category : #'instance creation' }
CrTodoType class >> uniqueInstance [

	self = CrTodoType ifTrue: [ self error: 'I''m an abstract class. Use one of my children.' ].
	^ uniqueInstance ifNil: [ uniqueInstance := super new ]
]

{ #category : #accessing }
CrTodoType class >> user [

	^ CrTodoTypeUser uniqueInstance
]

{ #category : #accessing }
CrTodoType >> defaultIconName [
	"This is the default icon to assing to a list when it is created"

	^ nil
]

{ #category : #accessing }
CrTodoType >> defaultName [
	"This is the default name to assing to a list when it is created"

	^ self name
]

{ #category : #accessing }
CrTodoType >> name [
	
	^ self subclassResponsibility
]

{ #category : #'ston persistence' }
CrTodoType >> stonContainSubObjects [
 
	^ false
]

{ #category : #'ston persistence' }
CrTodoType >> stonOn: stonWriter [
	
	stonWriter
		writeObject: CrTodoType basicNew
		listSingleton: self name asSymbol
]