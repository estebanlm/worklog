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

{ #category : #accessing }
CrTodoList class >> active [

	^ self selectOne: [ :each | each type = CrTodoType active ]
]

{ #category : #legacy }
CrTodoList class >> activeFileName [
			
	^ 'Active.ston'
]

{ #category : #accessing }
CrTodoList class >> allLists [
	| allLists |
	
	allLists := self selectAll.
	allLists ifEmpty: [ allLists := self createBaseLists ].
	^ allLists
]

{ #category : #legacy }
CrTodoList class >> baseListFileNames [

	^ { 
	self inboxFileName. 
	self activeFileName. 
	self unsortedFileName }
]

{ #category : #private }
CrTodoList class >> createBaseLists [
	
	^ { 
		(CrTodoList newType: CrTodoType inbox) save.
		(CrTodoList newType: CrTodoType active) save.
		(CrTodoList newType: CrTodoType unsorted) save }
]

{ #category : #accessing }
CrTodoList class >> inbox [

	^ self selectOne: [ :each | each type = CrTodoType inbox ]
]

{ #category : #legacy }
CrTodoList class >> inboxFileName [
			
	^ 'Inbox.ston'
]

{ #category : #testing }
CrTodoList class >> isVoyageRoot [

	^ true
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
CrTodoList class >> unsorted [

	^ self selectOne: [ :each | each type = CrTodoType unsorted ]
]

{ #category : #legacy }
CrTodoList class >> unsortedFileName [
			
	^ 'Unsorted.ston'
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
			read: [ :aList | aList type name ]
			write: [ :aList :typeName | aList setType: (CrTodoType perform: typeName asSymbol) ]);
		yourself
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
