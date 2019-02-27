"
I keep the configuration for the client. 
I'm saved in a file ""worklog.ston"" who should be placed at the side of the image who contains the application.
Since we are doing a stateless command line application, there is no problem on reading the configuration file each time we perform a task, because of this, the entry-point of this class is #readFromFileSystem (and not #new)

Take a look at #sample method to hints on config structure.
"
Class {
	#name : #WLClientConfiguration,
	#superclass : #Object,
	#instVars : [
		'url',
		'username',
		'password'
	],
	#category : 'WorkLog-Client-Model'
}

{ #category : #accessing }
WLClientConfiguration class >> configFileName [
	^ 'worklog.ston'
]

{ #category : #accessing }
WLClientConfiguration class >> defaultUrl [ 
	^ 'http://log.smallworks.eu'
]

{ #category : #'instance creation' }
WLClientConfiguration class >> readFromFileSystem [
	| reference |

	reference := (FileLocator imageDirectory / self configFileName) asFileReference.
	reference exists ifFalse: [ ^ self new ].
	^ reference readStreamDo: [ :stream | 
		STON fromStream: stream  ]
]

{ #category : #'instance creation' }
WLClientConfiguration class >> sample [
	"
	self configFileName asFileReference 
		writeStreamDo: [ :stream | STON put: self sample onStreamPretty: stream ]
	"
	^ self new 
		url: 'http://log.smallworks.eu';
		username: 'johndoe';
		password: '134885030126667754307791984366958960935';
		yourself
]

{ #category : #accessing }
WLClientConfiguration class >> stonName [
	^ #Worklog
]

{ #category : #accessing }
WLClientConfiguration >> hashPassword: aString [
	^ self password: (MD5 hashMessage:  aString) asInteger asString
]

{ #category : #accessing }
WLClientConfiguration >> password [
	^ password
]

{ #category : #accessing }
WLClientConfiguration >> password: anObject [
	password := anObject
]

{ #category : #accessing }
WLClientConfiguration >> url [
	^ url ifNil: [ url := self class defaultUrl ]
]

{ #category : #accessing }
WLClientConfiguration >> url: anObject [
	url := anObject
]

{ #category : #accessing }
WLClientConfiguration >> username [
	^ username
]

{ #category : #accessing }
WLClientConfiguration >> username: anObject [
	username := anObject
]

{ #category : #writing }
WLClientConfiguration >> writeToFile [
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
