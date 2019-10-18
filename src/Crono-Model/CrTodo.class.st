Class {
	#name : #CrTodo,
	#superclass : #Object,
	#instVars : [
		'name',
		'items'
	],
	#category : #'Crono-Model'
}

{ #category : #accessing }
CrTodo class >> active [

	^ self readListNamed: 'active.ston'
]

{ #category : #accessing }
CrTodo class >> inbox [

	^ self readListNamed: 'inbox.ston'
]

{ #category : #private }
CrTodo class >> readListNamed: aName [
	| reference |

	reference := CrCronoConfiguration readFromFileSystem todoReference / aName.
	reference exits ifNil: [ ^ self new ].
	^ reference readStreamDo: [ :stream |
		STON fromStream: stream ]
]
