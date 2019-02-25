"
I keep the configuration for crono. 
I'm saved in a file ""crono.ston"" who should be placed at the side of the image who contains the application.
Since we are doing a stateless command line application, there is no problem on reading the configuration file each time we perform a task, because of this, the entry-point of this class is #readFromFileSystem (and not #new)

Take a look at #sample method to hints on config structure.
"
Class {
	#name : #WLCronoConfiguration,
	#superclass : #Object,
	#instVars : [
		'baseDir'
	],
	#category : 'WorkLog-Client-Model'
}

{ #category : #accessing }
WLCronoConfiguration class >> configFileName [

	^ 'crono.ston'
]

{ #category : #'instance creation' }
WLCronoConfiguration class >> readFromFileSystem [
	| reference |
	
	reference := (FileLocator imageDirectory / self configFileName) asFileReference.
	reference exists ifFalse: [ ^ self new ].
	^ reference readStreamDo: [ :stream | 
		STON fromStream: stream  ]
]

{ #category : #'instance creation' }
WLCronoConfiguration class >> sample [
	"
	self configFileName asFileReference 
		writeStreamDo: [ :stream | STON put: self sample onStreamPretty: stream ]
	"
	^ self new 
		baseDir: '{home}/Dev/CronoLog';
		yourself
]

{ #category : #accessing }
WLCronoConfiguration class >> stonName [
	^ #Crono
]

{ #category : #accessing }
WLCronoConfiguration >> baseDir [
	^ baseDir
]

{ #category : #accessing }
WLCronoConfiguration >> baseDir: anObject [
	"baseDir is a directory to the place where crono logs will be stored"
	baseDir := anObject
]

{ #category : #accessing }
WLCronoConfiguration >> baseDirReference [
	"I will interpret #baseDir to allow users to declare FileLocator positions (just in first 
	 segment of path). 
	 e.g. I can intepret {home}/Dev/CronoLog"
	^ self baseDir first = ${
		ifTrue: [ self baseDirReferenceWithLocator ]
		ifFalse: [ self baseDir asFileReference ]
	
]

{ #category : #private }
WLCronoConfiguration >> baseDirReferenceWithLocator [
	"I interpret first entry as a location: {home}, {desktop}, {preferences}, etc. 
	 (See FileLocator class for others)"
	| segments location |
	segments := self baseDir substrings: (DiskStore delimiter) asString.
	location := (segments first copyFrom: 2 to: (segments first size - 1)) asSymbol. 
	^ segments allButFirst 
		inject: (FileLocator origin: location) asFileReference
		into: [ :all :each | all / each ]
]

{ #category : #writing }
WLCronoConfiguration >> writeToFile [
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
