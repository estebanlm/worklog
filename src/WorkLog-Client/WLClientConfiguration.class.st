"
I keep the configuration for the client. 
I'm saved in a file ""worklog.ston"" who should be placed at the side of the image who contains the application.
Since we are doing a stateless command line application, there is no problem on reading the configuration file each time we perform a task, because of this, the entry-point of this class is #readFromFileSystem (and not #new)

Take a look at #sample method to hints on config structure.
"
Class {
	#name : #WLClientConfiguration,
	#superclass : #WLConfiguration,
	#instVars : [
		'url',
		'username',
		'password'
	],
	#category : #'WorkLog-Client-Model'
}

{ #category : #accessing }
WLClientConfiguration class >> defaultUrl [ 
	^ 'http://log.smallworks.eu'
]

{ #category : #accessing }
WLClientConfiguration class >> fileName [

	^ 'worklog.ston'
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
