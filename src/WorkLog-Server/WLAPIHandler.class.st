"
I'm a REST API for worklog app.
I define all requests possible (add, review, etc.)
"
Class {
	#name : #WLAPIHandler,
	#superclass : #WARestfulHandler,
	#category : 'WorkLog-Server-View'
}

{ #category : #accessing }
WLAPIHandler class >> description [
	^ 'WorkLog API'
]

{ #category : #'class initialization' }
WLAPIHandler class >> initialize [
	WAAdmin register: self at: 'api'
]

{ #category : #actions }
WLAPIHandler >> addPost [
	<post>
	<path: '/add'>
	<consumes: 'text/plain'>
	<produces: 'application/json'>
	
	| text post |

	text := self request rawBody.
	text ifEmpty: [ ^ self responseError: 'No text log' ].
	
	post := (WLLog text: text) save.
	
	^ self responseOk: ('{1}, logged.' format: { post asString })
]

{ #category : #handling }
WLAPIHandler >> authenticateRequest: request [ 
	^ WLServerConfiguration uniqueInstance user
		validateUsername: request user
		password: request password
	
]

{ #category : #generation }
WLAPIHandler >> forbidden [
	self requestContext responseGenerator 
		forbidden; 
		respond 
]

{ #category : #handling }
WLAPIHandler >> handleFiltered: aRequestContext [
	(self authenticateRequest: aRequestContext request) 
		ifFalse: [ ^ self forbidden ].
	super handleFiltered: aRequestContext
]

{ #category : #actions }
WLAPIHandler >> notFound [ 
	self requestContext responseGenerator 
		notFound; 
		respond 
]

{ #category : #actions }
WLAPIHandler >> removePost: aString [
	<delete>
	<path: '/remove/{aString}'> 
	<produces: 'application/json'>
	| post |
	
	post := WLLog findByPermaLink: aString asNumber.	
	post ifNil: [ ^ self notFound ].
	
	post remove.
	
	^ self responseOk: ('{1}, removed.' format: { post asString })

	
]

{ #category : #accessing }
WLAPIHandler >> request [
	^ self requestContext request
]

{ #category : #actions }
WLAPIHandler >> resetConfig [
	<get>
	<path: '/admin/reset-config'> 
	<produces: 'application/json'>

	WLServerConfiguration installFromFileSystem.

	^ self responseOk: 'Configuration reloaded.'.
]

{ #category : #private }
WLAPIHandler >> responseError: aString [	
	^ STON toJsonString: (Dictionary new 
		at: #status put: 'Error';
		at: #message put: aString;
		yourself)


]

{ #category : #private }
WLAPIHandler >> responseOk: aString [ 
	^ STON toJsonString: (Dictionary new 
		at: #status put: 'Ok';
		at: #message put: aString;
		yourself)

]

{ #category : #private }
WLAPIHandler >> responseOkWith: aDictionary [ 
	^ STON toJsonString: (Dictionary new 
		at: #status put: 'Ok';
		addAll: aDictionary;
		yourself)

]

{ #category : #private }
WLAPIHandler >> responseOkWith: keyString value: jsonObject [
	^ self toJson: (Dictionary new 
		at: #status put: 'Ok';
		at: keyString put: jsonObject;
		yourself)

]

{ #category : #actions }
WLAPIHandler >> review: aString [
	"day/week/month"
	<get>
	<path: '/review/{aString}'> 
	<produces: 'application/json'>

	aString = 'day' ifTrue: [ ^ self responseOkWith: 'list' value: WLLog findDay asArray ].
	aString = 'week' ifTrue: [ ^ self responseOkWith: 'list' value: WLLog findWeek asArray ].
	aString = 'lastWeek' ifTrue: [ ^ self responseOkWith: 'list' value: WLLog findLastWeek asArray ].
	aString = 'month' ifTrue: [ ^ self responseOkWith: 'list' value: WLLog findMonth asArray ].
	
	^ self notFound
]

{ #category : #actions }
WLAPIHandler >> searchFrom: fromString to: toString [
	<get>
	<path: '/search?from={fromString}&to={toString}'> 
	<produces: 'application/json'>
	
	| fromDate toDate |
	
	fromDate := fromString asDateDMY.
	toDate := toString asDateDMY.	
	^ self 
		responseOkWith: 'list' 
		value: (WLLog findFrom: fromDate to: toDate) asArray

]

{ #category : #private }
WLAPIHandler >> toJson: jsonObject [
	^ STON toJsonString: jsonObject
]

{ #category : #actions }
WLAPIHandler >> updateApplication [
	<get>
	<path: '/admin/update-application'> 
	<produces: 'application/json'>

	WLApplicationUpdater uniqueInstance update.

	^ self responseOk: 'Application update started.'.
]

{ #category : #actions }
WLAPIHandler >> updateStatus [
	<get>
	<path: '/admin/update-status'> 
	<produces: 'application/json'>
	| update |

	update := WLApplicationUpdater uniqueInstance.
	^ self responseOkWith: (Dictionary new 
		at: #'updateStatus' put: update status;
		at: #'lastUpdateDate' put: (update lastUpdateDate ifNotNil: [ :v | v asJson ]);
		at: #'lastUpdateError' put: update lastErrorMessage;
		yourself).
]
