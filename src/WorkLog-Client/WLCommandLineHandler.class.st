"
Worklog is the command line interface for register logs in the worklog (http://log.smallworks.eu).

Usage:

    worklog --help
    worklog --add [--text=""<text to log>""|--file=""<file to use as text>""]
    worklog --open
    worklog --review  --lapse=[day|week|month]
    worklog --create-config
    worklog --update-server
    worklog --update-status
    worklog --update-client
    worklog --remove --id=""<log id>"" 

	--help		
		Prints this help.
		
	--add
		Adds a log..
		
	--text=""<text to log>""
		Specifies the text to log.
	
	--file=""<file to use as text>""		
		Specifies a file with the log.	
		
	--open-editor
		Opens a dialog to add a log.
		
	--review
		Prints a review of the worklog.
		
	--lapse=[day|week|month]
		--review will be printed for this day (this is the default), this week or this month.

	--create-config
		Create a sample configuration file.

	--update-server
		Starts and update process on server (it will be updated with master branch on github).
		
	--update-server-status
		Prints update status from server

	--update-client
		Updates this client (it will be updated with master branch on github).
		
	--remove
		Remove one log identified with the permaLink number (needs to be used with --id). 
		
	 --id=""<log id>"" 
		Refers to permaLink of the log to be removed with --remove 

"
Class {
	#name : #WLCommandLineHandler,
	#superclass : #CommandLineHandler,
	#instVars : [
		'remainAlive'
	],
	#category : #'WorkLog-Client-CommandLine'
}

{ #category : #accessing }
WLCommandLineHandler class >> commandName [
	^ 'worklog'
]

{ #category : #accessing }
WLCommandLineHandler class >> description [
	^ 'Registers *my* work log into http://log.smallworks.eu'
]

{ #category : #activation }
WLCommandLineHandler >> activate [
	self activateHelpWithoutArguments ifTrue: [ ^ self ].
	
	(self argumentAt: 1) = '--add' ifTrue: [ ^ self activateAdd ].
	(self argumentAt: 1) = '--open-editor' ifTrue: [ ^ self activateOpen ].
	(self argumentAt: 1) = '--review' ifTrue: [ ^ self activateReview ]. 
	(self argumentAt: 1) = '--create-config' ifTrue: [ ^ self activateCreateConfig ]. 
	(self argumentAt: 1) = '--reset-server-config' ifTrue: [ ^ self activateResetServerConfig ]. 
	(self argumentAt: 1) = '--update-server' ifTrue: [ ^ self activateUpdateServer ].
	(self argumentAt: 1) = '--update-server-status' ifTrue: [ ^ self activateServerStatus ].
	(self argumentAt: 1) = '--update-client' ifTrue: [ ^ self activateUpdateClient ]. 
	(self argumentAt: 1) = '--remove' ifTrue: [ ^ self activateRemove ]. 
	
	self error: 'Not recognised: ', (self argumentAt: 1).
]

{ #category : #activation }
WLCommandLineHandler >> activateAdd [
	
	(self hasOption: 'text') ifTrue: [ 
		self addPost: self text. 
		^ self quit ].
	(self hasOption: 'file') ifTrue: [ 
		self addPost: self fileContents. 
		^ self quit ].
	
	self error: 'You need to specify --text or --file.'

]

{ #category : #activation }
WLCommandLineHandler >> activateCreateConfig [
	[ WLClientConfiguration sample writeToFile.
	  self inform: WLClientConfiguration fileName, ' created.' ]
	on: Error do: [ :e | self error: e messageText ].
	self quit.	
]

{ #category : #activation }
WLCommandLineHandler >> activateOpen [
	self flag: #todo.
	self error: 'Not implemented yet'
]

{ #category : #activation }
WLCommandLineHandler >> activateRemove [
	
	(self hasOption: 'id') ifFalse: [ self error: 'You need to specify --id.' ].
	self removePost: self id. 	
	^ self quit
	
	

]

{ #category : #activation }
WLCommandLineHandler >> activateResetServerConfig [
	| response |
	[ response := self client resetServerConfig ]
	on: Error do: [ :e | self error: e messageText ].
	self inform: response.
	self quit
]

{ #category : #activation }
WLCommandLineHandler >> activateReview [
	| list |

	(self hasOption: 'lapse') ifFalse: [ self error: 'You need to specify --lapse.' ].

	[ list := self client review: self lapse ]
	on: Error do: [ :e | self error: e messageText ].
	self exportAsChangeLog: list.
	self quit.
]

{ #category : #activation }
WLCommandLineHandler >> activateServerStatus [
	| response |
	[ response := self client updateStatus ]
	on: Error do: [ :e | self error: e messageText ].
	self inform: response.
	self quit
]

{ #category : #activation }
WLCommandLineHandler >> activateUpdateClient [
	self flag: #todo.
	self error: 'Not implemented yet'
]

{ #category : #activation }
WLCommandLineHandler >> activateUpdateServer [
	| response |
	[ response := self client updateServer ]
	on: Error do: [ :e | self error: e messageText ].
	self inform: response.
	self quit
]

{ #category : #private }
WLCommandLineHandler >> addPost: aString [
	| response |
	[ response := self client add: aString ]
	on: Error do: [ :e | self error: e messageText ].
	self inform: response.

]

{ #category : #accessing }
WLCommandLineHandler >> client [
	^ WLClient uniqueInstance
]

{ #category : #private }
WLCommandLineHandler >> error: aString [ 
	| prefix |
	prefix := (aString beginsWith: 'Error:') 
		ifTrue: [ '' ] 
		ifFalse: [ 'Error: ' ].
	self exitFailure: prefix, aString
]

{ #category : #private }
WLCommandLineHandler >> exportAsChangeLog: aCollection [
	| builder cr |
	
	cr := OSPlatform current lineEnding.
	builder := WLChangeLogBuilder rawLogs: aCollection.
	builder 
		withDateDo: [ :each |  
			Stdio stdout 
				<< each asString << ':' << cr
				<< (String new: (each asString size + 1) withAll: $-) << cr << cr ]
		withChangeLogDo: [ :each | Stdio stdout << (each withLineEndings: cr) ]
		separatedBy: [ Stdio stdout << cr << cr ]
]

{ #category : #accessing }
WLCommandLineHandler >> fileContents [
	| fileName reference |
	fileName := self withoutQuotes: (self optionAt: 'file').
	reference := fileName asFileReference. 
	reference exists 
		ifFalse: [ self error: ('File {1} does not exists.' format: { reference fullName }) ].
	^ reference readStreamDo: [ :stream |
		stream contents ]
]

{ #category : #accessing }
WLCommandLineHandler >> id [
	^ self withoutQuotes: (self optionAt: 'id').

]

{ #category : #private }
WLCommandLineHandler >> inform: aString [
 
	self stdout green: aString. 
	self stdout << OSPlatform current lineEnding
]

{ #category : #testing }
WLCommandLineHandler >> isRemainAlive [

	^ remainAlive
]

{ #category : #accessing }
WLCommandLineHandler >> lapse [
	^ self withoutQuotes: (self optionAt: 'lapse')
]

{ #category : #private }
WLCommandLineHandler >> removePost: aString [
	| response |
	[ response := self client remove: aString ]
	on: Error do: [ :e | self error: e messageText ].
	self inform: response.
]

{ #category : #accessing }
WLCommandLineHandler >> text [
	^ self withoutQuotes: (self optionAt: 'text').

]

{ #category : #private }
WLCommandLineHandler >> toChangeLog: postDictionary [
	| lines |
	lines := (postDictionary at: 'text') withNoLineLongerThan: 80.
	^ String streamContents: [ :stream | 
			stream << ' * ' << lines first.
			lines allButFirst
				do: [ :each | stream << '   ' << each ]
				separatedBy: [ stream cr ]]
	
]

{ #category : #private }
WLCommandLineHandler >> withoutQuotes: aString [
	^ (aString first = $" and: [ aString last = $" ])
		ifTrue: [ aString  copyFrom: 2 to: (aString size - 1) ]
		ifFalse: [ aString ]

]
