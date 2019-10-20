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

	^ (self readListNamed: 'active.ston')
		ifNil: [ 
			self new 
				name: 'Active';
				iconName: #active;
				writeToFile ]
]

{ #category : #accessing }
CrTodoList class >> allLists [

	^ { self inbox. self active }, self userLists
]

{ #category : #accessing }
CrTodoList class >> inbox [

	^ (self readListNamed: 'inbox.ston')
		ifNil: [ 
			self new 
				name: 'Inbox';
				iconName: #inbox;
				writeToFile ]
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

{ #category : #private }
CrTodoList class >> todoUserListReference [
	
	^ (self todoListReference / 'Lists') ensureCreateDirectory
]

{ #category : #accessing }
CrTodoList class >> userLists [

	^ (self todoUserListReference allChildrenMatching: '*.ston')
		collect: [ :each | self readList: each ]
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

	
]
