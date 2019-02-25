"
I'm a façade to connect client with server.
I implement the messages the client is capable of send.

The ""actions"" protocol contains all this actions.
"
Class {
	#name : #WLClient,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'WorkLog-Client-Model'
}

{ #category : #'instance creation' }
WLClient class >> new [
	self error: 'Use #uniqueInstance'
]

{ #category : #'instance creation' }
WLClient class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := super new ]
]

{ #category : #accessing }
WLClient class >> url [
	^ 'http://log.smallworks.eu/api'
]

{ #category : #actions }
WLClient >> add: aString [ 
	| response |
	
	response := (self connectionTo: 'add')
		entity: (ZnEntity text: aString);
		contentType: ZnMimeType textPlain;
		post;
		response.
		
	^ self validateResponseAndAnswerMessage: response
]

{ #category : #private }
WLClient >> connectionTo: aString [
	| config |
	config := WLClientConfiguration readFromFileSystem. 
	^ ZnClient new 
		beOneShot;
		url: config url;
		username: config username password: config password;
		addPathSegment: aString;
		yourself
		
		
]

{ #category : #actions }
WLClient >> remove: aString [
	| response |
	
	response := (self connectionTo: 'remove')
		addPathSegment: aString;
		delete;
		response.
		
	^ self validateResponseAndAnswerMessage: response
	
	
	
]

{ #category : #actions }
WLClient >> resetServerConfig [
	| response |
	
	response := (self connectionTo: '/admin/reset-server-config')
		get;
		response.
		
	^ self validateResponseAndAnswerMessage: response
]

{ #category : #actions }
WLClient >> review: aString [ 
	"aString can be 'day', 'week', 'lastWeek' or 'month'"
	| response |
	
	response := (self connectionTo: 'review')
		addPathSegment: aString;
		get;
		response.
		
	^ (self validateResponse: response) at: #list.
	
	
]

{ #category : #actions }
WLClient >> searchFrom: fromString to: toString [ 
	"from/to strings are of the form 'd/m/y'"
	| response |
	
	response := (self connectionTo: 'search')
		queryAt: 'from' put: fromString;
		queryAt: 'to' put: toString;
		get;
		response.
		
	^ (self validateResponse: response) at: #list.
	
	
]

{ #category : #actions }
WLClient >> updateServer [
	| response |
	
	response := (self connectionTo: '/admin/update-application')
		get;
		response.
		
	^ self validateResponseAndAnswerMessage: response
]

{ #category : #actions }
WLClient >> updateStatus [
	| response |
	
	response := (self connectionTo: '/admin/update-status')
		get;
		response.
		
	^ self validateResponse: response
]

{ #category : #private }
WLClient >> validateResponse: response [
	| jsonResult |

	response isError 
		ifTrue: [ ^ self error: 'Server error ', response code asString ].
		
	jsonResult := STON fromString: response contents.
	((jsonResult at: #status) = 'Error')
 		ifTrue: [ ^ self error: (jsonResult at: #message) ].

	^ jsonResult		
	
]

{ #category : #private }
WLClient >> validateResponseAndAnswerMessage: response [
	^ (self validateResponse: response) at: #message 		
	
]
