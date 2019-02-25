"
I keep the configuration for the serber. 
I'm saved in a file ""worklog-server.ston"" who should be placed at the side of the image who contains the application.

I'm a singleton, but my values can be reseted executing #installFromFileSystem.

Take a look at #sample method to hints on config structure.
"
Class {
	#name : #WLServerConfiguration,
	#superclass : #Object,
	#instVars : [
		'title',
		'url',
		'host',
		'port',
		'database',
		'user',
		'header',
		'disqusAccount',
		'production'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'WorkLog-Server-Model'
}

{ #category : #accessing }
WLServerConfiguration class >> configFileName [
	^ 'worklog-server.ston'
]

{ #category : #'instance creation' }
WLServerConfiguration class >> installFromFileSystem [
	| newConfiguration reference |
	reference := self configFileName asFileReference.
	reference exists 
		ifFalse: [ self error: 'I cannot find ', reference fullName, ' configuration file.' ].
	reference readStreamDo: [ :stream | 
		newConfiguration := STON fromStream: stream ].

	uniqueInstance := newConfiguration.
]

{ #category : #accessing }
WLServerConfiguration class >> sample [
	"
	self configFileName asFileReference 
		writeStreamDo: [ :stream | STON put: self sample onStreamPretty: stream ]
	"
	^ self new 
		host: 'localhost'; 			"Optional"
		port: 27017;						"Optional"
		production: true;           "Optional"						
		title: 'My Worklog';
		url: 'http://localhost:8080';
		header: 'My Worklog';       "Optional"
		disqusAccount: 'johndoe-worklog';
		database: 'johndoe-log';	
		user: (WLUser new 
			username: 'johndoe';
			hashPassword: 'secret';
			fullName: 'John Doe';
			gravatarUrl: 'https://secure.gravatar.com/gravatar/123456789';
			yourself);
		yourself
]

{ #category : #accessing }
WLServerConfiguration class >> stonName [
	^ #WorklogServer
]

{ #category : #'instance creation' }
WLServerConfiguration class >> uniqueInstance [ 
	^ uniqueInstance ifNil: [ 
		self installFromFileSystem.
		uniqueInstance ]
]

{ #category : #accessing }
WLServerConfiguration >> database [
	^ database
]

{ #category : #accessing }
WLServerConfiguration >> database: anObject [
	database := anObject
]

{ #category : #accessing }
WLServerConfiguration >> disqusAccount [
	^ disqusAccount
]

{ #category : #accessing }
WLServerConfiguration >> disqusAccount: anObject [
	disqusAccount := anObject
]

{ #category : #accessing }
WLServerConfiguration >> header [
	^ header
]

{ #category : #accessing }
WLServerConfiguration >> header: anObject [
	header := anObject
]

{ #category : #accessing }
WLServerConfiguration >> host [
	^ host
]

{ #category : #accessing }
WLServerConfiguration >> host: anObject [
	host := anObject
]

{ #category : #accessing }
WLServerConfiguration >> port [
	^ port
]

{ #category : #accessing }
WLServerConfiguration >> port: anObject [
	port := anObject
]

{ #category : #accessing }
WLServerConfiguration >> production [
	^ production
]

{ #category : #accessing }
WLServerConfiguration >> production: anObject [
	production := anObject
]

{ #category : #accessing }
WLServerConfiguration >> title [
	^ title ifNil: [ self user fullName, '''s log' ]
]

{ #category : #accessing }
WLServerConfiguration >> title: aString [
	title := aString
]

{ #category : #accessing }
WLServerConfiguration >> url [
	^ url
]

{ #category : #accessing }
WLServerConfiguration >> url: anObject [
	url := anObject
]

{ #category : #accessing }
WLServerConfiguration >> user [
	^ user
]

{ #category : #accessing }
WLServerConfiguration >> user: anObject [
	user := anObject
]

{ #category : #writing }
WLServerConfiguration >> writeToFile [
	| reference |
	reference := self class configFileName asFileReference.
	reference exists ifTrue: [ 
		self error: ('There is already a configuration file at {1}/{2}.' 
			format: { 
				FileSystem workingDirectory fullName. 
				self class configFileName }) ]. 
	reference writeStreamDo: [ :stream | 
		STON put: self asJsonOnStreamPretty: stream ]
]
