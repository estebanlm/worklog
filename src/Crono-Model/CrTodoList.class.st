Class {
	#name : #CrTodoList,
	#superclass : #Object,
	#instVars : [
		'name',
		'iconName',
		'items'
	],
	#category : #'Crono-Model'
}

{ #category : #accessing }
CrTodoList class >> active [

	^ (self readListNamed: self activeFileName)
		ifNil: [ 
			self new 
				name: 'Active';
				iconName: #active;
				writeToFile ]
]

{ #category : #accessing }
CrTodoList class >> activeFileName [
			
	^ 'Active.ston'
]

{ #category : #accessing }
CrTodoList class >> allLists [

	^ self baseLists, self userLists
]

{ #category : #accessing }
CrTodoList class >> baseListFileNames [

	^ { self inboxFileName. self activeFileName }
]

{ #category : #accessing }
CrTodoList class >> baseLists [

	^ { self inbox. self active }
]

{ #category : #accessing }
CrTodoList class >> inbox [

	^ (self readListNamed: self inboxFileName)
		ifNil: [ 
			self new 
				name: 'Inbox';
				iconName: #inbox;
				writeToFile ]
]

{ #category : #accessing }
CrTodoList class >> inboxFileName [
			
	^ 'Inbox.ston'
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

{ #category : #private }
CrTodoList class >> todoListReference [
	
	^ CrCronoConfiguration readFromFileSystem todoListReference
]

{ #category : #accessing }
CrTodoList class >> userLists [

	^ (self todoListReference allChildrenMatching: '*.ston')
		reject: [ :each | self baseListFileNames includes: each basename ]
		thenCollect: [ :each | self readList: each ]
]

{ #category : #adding }
CrTodoList >> addItem: anItem [ 

	items add: anItem
]

{ #category : #accessing }
CrTodoList >> iconName [

	^ iconName
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

	^ name
]

{ #category : #accessing }
CrTodoList >> name: aString [

	name := aString
]

{ #category : #writing }
CrTodoList >> writeToFile [
	| reference |

	reference := (self class todoListReference / self name) withExtension: 'ston'.
	reference writeStreamDo: [ :stream | 
		STON put: self onStreamPretty: stream ]	
]
