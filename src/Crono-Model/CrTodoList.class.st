Class {
	#name : #CrTodoList,
	#superclass : #Object,
	#instVars : [
		'name',
		'iconName',
		'type',
		'items'
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

	^ { self inboxFileName. self activeFileName }
]

{ #category : #'accessing lists' }
CrTodoList class >> baseLists [

	^ { self inbox. self active }
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
CrTodoList class >> userLists [

	^ (self todoListReference allChildrenMatching: '*.ston')
		reject: [ :each | self baseListFileNames includes: each basename ]
		thenCollect: [ :each | self readList: each ]
]

{ #category : #adding }
CrTodoList >> addItem: anItem [ 

	items add: anItem
]

{ #category : #'as yet unclassified' }
CrTodoList >> doneItems [

	^ self items select: #isDone
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
	items := OrderedCollection new
]

{ #category : #initialization }
CrTodoList >> initializeType: aType [

	self initialize.
	type := aType
]

{ #category : #accessing }
CrTodoList >> items [

	^ items
]

{ #category : #accessing }
CrTodoList >> items: aCollection [

	items := aCollection asOrderedCollection
]

{ #category : #accessing }
CrTodoList >> name [

	^ name ifNil: [ self type defaultName ]
]

{ #category : #accessing }
CrTodoList >> name: aString [

	name := aString
]

{ #category : #'as yet unclassified' }
CrTodoList >> numberDoneItems [

	^ self doneItems size
]

{ #category : #'as yet unclassified' }
CrTodoList >> numberItems [

	^ self items size
]

{ #category : #'as yet unclassified' }
CrTodoList >> numberPendingItems [

	^ self pendingItems size
]

{ #category : #'as yet unclassified' }
CrTodoList >> pendingItems [

	^ self items reject: #isDone
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
