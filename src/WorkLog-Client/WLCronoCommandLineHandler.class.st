"
Crono is the command line interface for register logs in the cronolog .

Usage:

    crono --help
    crono --add [--text=""<text to log>""|--file=""<file to use as text>""]
    crono --todayReference 
    crono --review 

	--help		
		Prints this help.
		
	--add
		Adds a log.
		
	--text=""<text to log>""
		Specifies the text to log.
	
	--file=""<file to use as text>""		
		Specifies a file with the log.	

	--todayReference
		Prints full path to today's reference.

	--review
		Prints a review of the daily crono-log.

"
Class {
	#name : #WLCronoCommandLineHandler,
	#superclass : #CommandLineHandler,
	#category : #'WorkLog-Client-CommandLine'
}

{ #category : #accessing }
WLCronoCommandLineHandler class >> commandName [

	^ 'crono'
]

{ #category : #accessing }
WLCronoCommandLineHandler class >> description [

	^ 'Appends a log into WLCrono class>>#baseDir / Date today'
]

{ #category : #activation }
WLCronoCommandLineHandler >> activate [

	self activateHelpWithoutArguments ifTrue: [ ^ self ].
	
	(self argumentAt: 1) = '--add' ifTrue: [ ^ self activateAdd ].
	(self argumentAt: 1) = '--review' ifTrue: [ ^ self activateReview ]. 
	(self argumentAt: 1) = '--todayReference' ifTrue: [ ^ self activateTodayReference ]. 

	self error: 'Not recognised: ', (self argumentAt: 1).
]

{ #category : #activation }
WLCronoCommandLineHandler >> activateAdd [
	
	(self hasOption: 'text') ifTrue: [ 
		self addLog: self text. 
		^ self quit ].
	(self hasOption: 'file') ifTrue: [ 
		self addLog: self fileContents. 
		^ self quit ].
	
	self error: 'You need to specify --text or --file.'

]

{ #category : #activation }
WLCronoCommandLineHandler >> activateReview [

	self printDailyReview.
	self quit.
]

{ #category : #activation }
WLCronoCommandLineHandler >> activateTodayReference [
	self printTodayReference.
	self quit.
]

{ #category : #private }
WLCronoCommandLineHandler >> addLog: aString [

	self crono log: aString trimBoth.
	self inform: 'Logged.'
]

{ #category : #accessing }
WLCronoCommandLineHandler >> crono [

	^ CrCrono new
]

{ #category : #private }
WLCronoCommandLineHandler >> error: aString [ 
	| prefix |
	prefix := (aString beginsWith: 'Error:') 
		ifTrue: [ '' ] 
		ifFalse: [ 'Error: ' ].
	self exitFailure: prefix, aString
]

{ #category : #private }
WLCronoCommandLineHandler >> fileContents [
	| fileName reference |
	fileName := self withoutQuotes: (self optionAt: 'file').
	reference := fileName asFileReference. 
	reference exists 
		ifFalse: [ self error: ('File {1} does not exists.' format: { reference fullName }) ].
	^ reference readStreamDo: [ :stream |
		stream contents ]
]

{ #category : #private }
WLCronoCommandLineHandler >> inform: aString [ 
	self stdout green: aString. 
	self stdout << OSPlatform current lineEnding
]

{ #category : #private }
WLCronoCommandLineHandler >> printDailyReview [

	self stdout << self optionAt: 'review'.
	self stdout << self crono review
]

{ #category : #private }
WLCronoCommandLineHandler >> printDailyReview: daysRange [

	self stdout << self crono review: daysRange
]

{ #category : #private }
WLCronoCommandLineHandler >> printTodayReference [
	self stdout << self crono todayReference fullName.
	
]

{ #category : #accessing }
WLCronoCommandLineHandler >> text [
	^ self withoutQuotes: (self optionAt: 'text').

]

{ #category : #private }
WLCronoCommandLineHandler >> withoutQuotes: aString [
	^ (aString first = $" and: [ aString last = $" ])
		ifTrue: [ aString  copyFrom: 2 to: (aString size - 1) ]
		ifFalse: [ aString ]

]
