"
I'm a user defined lists. 
Of course, this is the most important list we can have since is the one that keep usert tasks.


"
Class {
	#name : #CrTodoList,
	#superclass : #CrAbstractList,
	#instVars : [
		'type',
		'name',
		'iconName',
		'tasks'
	],
	#category : #'Crono-Model'
}

{ #category : #legacy }
CrTodoList class >> activeFileName [
			
	^ 'Active.ston'
]

{ #category : #accessing }
CrTodoList class >> allLists [
	
	^ self baseLists, self userLists
]

{ #category : #legacy }
CrTodoList class >> baseListFileNames [

	^ { 
	self inboxFileName. 
	self activeFileName. 
	self unsortedFileName }
]

{ #category : #accessing }
CrTodoList class >> baseLists [

	"This is just an easy way to keep cached the base objects to avoid making a select each time
	 (which can be time consuming, just to bring some lists we already know are there).
	 Yes it is a HACK :P"
	^ CrApplication current 
		propertyAt: #baseLists 
		ifAbsentPut: [ { self inbox. self focus. self unsorted } ]
]

{ #category : #accessing }
CrTodoList class >> focus [

	^ CrFocusList uniqueInstance
]

{ #category : #accessing }
CrTodoList class >> inbox [

	^ self selectOne: [ :each | each type = CrTodoType inbox typeName ]
]

{ #category : #legacy }
CrTodoList class >> inboxFileName [
			
	^ 'Inbox.ston'
]

{ #category : #testing }
CrTodoList class >> isVoyageRoot [

	^ true
]

{ #category : #accessing }
CrTodoList class >> listNamed: aString [
	
	^ self selectOne: [ :each | each name = aString ]
]

{ #category : #private }
CrTodoList class >> newBaseLists [
	
	^ { 
		(CrTodoList newType: CrTodoType inbox).
		(CrTodoList newType: CrTodoType unsorted)
	}
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

{ #category : #legacy }
CrTodoList class >> readList: reference [

	reference exists ifFalse: [ ^ nil ].
	^ reference readStreamDo: [ :stream |
		STON fromStream: stream ]
]

{ #category : #legacy }
CrTodoList class >> readListNamed: aName [

	^ self readList: self todoListReference / aName
]

{ #category : #legacy }
CrTodoList class >> stonAllInstVarNames [
	
	^ super stonAllInstVarNames copyWithoutAll: self transientInstVarNames
]

{ #category : #legacy }
CrTodoList class >> stonName [

	^ 'TodoList'
]

{ #category : #accessing }
CrTodoList class >> summaryString [

	^ '{1} pending task{2} ({3} completed).'
]

{ #category : #legacy }
CrTodoList class >> todoListReference [
	
	^ CrCronoConfiguration readFromFileSystem todoListReference
]

{ #category : #legacy }
CrTodoList class >> transientInstVarNames [
	"We will not save this in file (because it will be calculated)"

	^ #()
]

{ #category : #accessing }
CrTodoList class >> trash [

	^ CrArchiveList uniqueInstance
]

{ #category : #accessing }
CrTodoList class >> unsorted [

	^ self selectOne: [ :each | each type = CrTodoType unsorted typeName ]
]

{ #category : #legacy }
CrTodoList class >> unsortedFileName [
			
	^ 'Unsorted.ston'
]

{ #category : #accessing }
CrTodoList class >> userLists [
	
	^ self selectMany: [ :each | each type = CrTodoType user typeName ]
]

{ #category : #persistence }
CrTodoList class >> voyageCollectionName [

	^ 'lists'
]

{ #category : #persistence }
CrTodoList class >> voyageRepository [

	^ CrApplication current repository
]

{ #category : #persistence }
CrTodoList class >> voyageType [
	<voyageDescription>
	
	^ VOToOneDescription new 
		attributeName: 'type';
		accessor: (MAPluggableAccessor 
			read: [ :aList | aList type typeName ]
			write: [ :aList :typeName | aList setType: (CrTodoType perform: typeName asSymbol) ]);
		yourself
]

{ #category : #accessing }
CrTodoList >> addTask: aTask [ 

	tasks add: aTask
]

{ #category : #accessing }
CrTodoList >> completion [

	self tasksSize = 0 ifTrue: [ ^ 0 ].  
	^ self doneTasksSize / self tasksSize
]

{ #category : #accessing }
CrTodoList >> iconName [

	^ iconName ifNil: [ super iconName ]
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
	self setType: aType
]

{ #category : #accessing }
CrTodoList >> name [

	^ name ifNil: [ self type defaultName ]
]

{ #category : #accessing }
CrTodoList >> name: aString [

	name := aString
]

{ #category : #printing }
CrTodoList >> printOn: stream [

	super printOn: stream.
	stream << '(' << self name << ')'
]

{ #category : #persistence }
CrTodoList >> remove [

	self tasks copy 
		do: [ :each | self removeTask: each ].
	super remove
]

{ #category : #accessing }
CrTodoList >> removeAllTasks [
	
	tasks := Array new
]

{ #category : #accessing }
CrTodoList >> removeTask: aTask [

	^ self tasks remove: aTask
]

{ #category : #private }
CrTodoList >> setType: aType [

	type := aType
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
