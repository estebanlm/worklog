"
I'm the user who can utilise his WorkLog.
I'm stored into a configuration.
"
Class {
	#name : #WLUser,
	#superclass : #Object,
	#instVars : [
		'username',
		'password',
		'email',
		'fullName',
		'gravatarUrl'
	],
	#category : 'WorkLog-Server-Model'
}

{ #category : #accessing }
WLUser class >> stonName [
	^ #User
]

{ #category : #accessing }
WLUser >> email [
	^ email
]

{ #category : #accessing }
WLUser >> email: anObject [
	email := anObject
]

{ #category : #accessing }
WLUser >> fullName [
	^ fullName
]

{ #category : #accessing }
WLUser >> fullName: anObject [
	fullName := anObject
]

{ #category : #accessing }
WLUser >> gravatarUrl [
	^ gravatarUrl
]

{ #category : #accessing }
WLUser >> gravatarUrl: anObject [
	gravatarUrl := anObject
]

{ #category : #accessing }
WLUser >> hashPassword: aString [
	^ self password: (MD5 hashMessage:  aString) asInteger asString
]

{ #category : #accessing }
WLUser >> password [
	^ password
]

{ #category : #accessing }
WLUser >> password: anObject [
	password := anObject
]

{ #category : #accessing }
WLUser >> username [
	^ username
]

{ #category : #accessing }
WLUser >> username: anObject [
	username := anObject
]

{ #category : #testing }
WLUser >> validateUsername: anUsername password: aPassword [
	^ self username = anUsername 
		and: [ self password = aPassword ]
]
