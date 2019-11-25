Class {
	#name : #CrTodoList,
	#superclass : #Object,
	#instVars : [
		'name',
		'iconName',
		'type',
		'tasks'
	],
	#category : #'Crono-Model'
}

{ #category : #'accessing lists' }
CrTodoList class >> active [

	^ (self readListNamed: self activeFileName)
		ifNil: [ (self newType: CrTodoType active) writeToFile ]
]

{ #category : #accessing }
CrTodoList class >> activeFileName [
			
	^ 'Active.ston'
]

{ #category : #'accessing lists' }
CrTodoList class >> allLists [

	^ self baseLists, self userLists
]

{ #category : #accessing }
CrTodoList class >> baseListFileNames [

	^ { 
	self inboxFileName. 
	self activeFileName. 
	self unsortedFileName }
]

{ #category : #'accessing lists' }
CrTodoList class >> baseLists [

	^ { 
	self inbox. 
	self active. 
	self unsorted }
]

{ #category : #'accessing lists' }
CrTodoList class >> inbox [

	^ (self readListNamed: self inboxFileName)
		ifNil: [ (self newType: CrTodoType inbox) writeToFile ]
]

{ #category : #accessing }
CrTodoList class >> inboxFileName [
			
	^ 'Inbox.ston'
]

{ #category : #'instance creation' }
CrTodoList class >> newName: aString [

	^ (self newType: CrTodoType user) 
		name: aString;
		yourself
]

{ #category : #'instance creation' }
CrTodoList class >> newType: aListType [

	^ self basicNew
		initializeType: aListType;
		yourself
]

{ #category : #private }
CrTodoList class >> readList: reference [

	reference exists ifFalse: [ ^ nil ].
	^ reference readStreamDo: [ :stream |
		STON fromStream: stream ]
]

{ #category : #private }
CrTodoList class >> readListNamed: aName [

	^ self readList: self todoListReference / aName
]

{ #category : #'private accessing' }
CrTodoList class >> stonAllInstVarNames [
	
	^ super stonAllInstVarNames copyWithoutAll: self transientInstVarNames
]

{ #category : #'ston-core' }
CrTodoList class >> stonName [

	^ 'TodoList'
]

{ #category : #private }
CrTodoList class >> todoListReference [
	
	^ CrCronoConfiguration readFromFileSystem todoListReference
]

{ #category : #'private accessing' }
CrTodoList class >> transientInstVarNames [
	"We will not save this in file (because it will be calculated)"

	^ #()
]

{ #category : #'accessing lists' }
CrTodoList class >> unsorted [

	^ (self readListNamed: self unsortedFileName)
		ifNil: [ (self newType: CrTodoType unsorted) writeToFile ]
]

{ #category : #accessing }
CrTodoList class >> unsortedFileName [
			
	^ 'Unsorted.ston'
]

{ #category : #'accessing lists' }
CrTodoList class >> userLists [

	^ (self todoListReference allChildrenMatching: '*.ston')
		reject: [ :each | self baseListFileNames includes: each basename ]
		thenCollect: [ :each | self readList: each ]
]

{ #category : #comparing }
CrTodoList >> = other [

	self species = other species ifFalse: [ ^ false ].
	self type = other type ifFalse: [ ^ false ].
	^ self name = other name
]

{ #category : #accessing }
CrTodoList >> addItem: anItem [ 

	tasks add: anItem
]

{ #category : #accessing }
CrTodoList >> doneTasks [

	^ self tasks select: #isDone
]

{ #category : #comparing }
CrTodoList >> hash [

	^ self type hash bitXor: self name hash
]

{ #category : #accessing }
CrTodoList >> iconName [

	^ iconName ifNil: [ self type defaultIconName ]
]

{ #category : #accessing }
CrTodoList >> iconName: aSymbol [

	iconName := aSymbol
]

{ #category : #initialization }
CrTodoList >> initialize [

	super initialize.
	tasks := OrderedCollection new
]

{ #category : #initialization }
CrTodoList >> initializeType: aType [

	self initialize.
	type := aType
]

{ #category : #accessing }
CrTodoList >> name [

	^ name ifNil: [ self type defaultName ]
]

{ #category : #accessing }
CrTodoList >> name: aString [

	name := aString
]

{ #category : #accessing }
CrTodoList >> numberDoneTasks [

	^ self doneTasks size
]

{ #category : #accessing }
CrTodoList >> numberPendingTasks [

	^ self pendingTasks size
]

{ #category : #accessing }
CrTodoList >> numberTasks [

	^ self tasks size
]

{ #category : #accessing }
CrTodoList >> pendingTasks [

	^ self tasks reject: #isDone
]

{ #category : #printing }
CrTodoList >> printOn: stream [

	super printOn: stream.
	stream << '(' << self name << ')'
]

{ #category : #accessing }
CrTodoList >> tasks [

	^ tasks
]

{ #category : #accessing }
CrTodoList >> tasks: aCollection [

	tasks := aCollection asOrderedCollection
]

{ #category : #accessing }
CrTodoList >> type [

	^ type
]

{ #category : #accessing }
CrTodoList >> type: aListType [

	type := aListType
]

{ #category : #writing }
CrTodoList >> writeToFile [
	| reference |

	reference := (self class todoListReference / self name) withExtension: 'ston'.
	reference writeStreamDo: [ :stream | 
		STON put: self onStreamPretty: stream ]
]
