Class {
	#name : #CrBaseCrono,
	#superclass : #Object,
	#classVars : [
		'ActiveClass'
	],
	#category : #'Crono-Model'
}

{ #category : #accessing }
CrBaseCrono class >> activeClass [

	^ ActiveClass ifNil: [ 
		self useCronoFile.
		ActiveClass ]
]

{ #category : #accessing }
CrBaseCrono class >> activeClass: aClass [

	ActiveClass := aClass
]

{ #category : #'command line' }
CrBaseCrono class >> commandLine [
	<commandline>
	
	^ (ClapCommand withName: 'crono')
		description: 'Manage a crono worklog.';
		add: ClapFlag forHelp;
		add: self commandLineAdd;
		add: self commandLineReview;
		add: self commandLineTodayReference;
		meaning: [ :args | 
			args atName: 'help' ifFound: [ :help | help value; exitSuccess ] ]
]

{ #category : #'command line' }
CrBaseCrono class >> commandLineAdd [

	^ (ClapCommand withName: 'add')
		description: 'Log some work.';
		add: ((ClapPositional withName: 'LOG') 
			description: 'The work to log.';
			multiple: true);
		meaning: [ :args | self new log:  (' ' join: (args occurrencesNamed: 'LOG' collect: #value)) ]
]

{ #category : #'command line' }
CrBaseCrono class >> commandLineReview [

	^ (ClapCommand withName: 'review')
		description: 'Review crono worklog dates.';
		add: ((ClapPositional withName: 'range') implicitMeaning: [ '0' ]);
		meaning: [ :args | self new review: (CrCronoRange fromString: (args atName: 'range') value) ]
]

{ #category : #'command line' }
CrBaseCrono class >> commandLineTodayReference [

	^ (ClapCommand withName: 'todayReference')
		description: 'Prints path of current using file.';
		meaning: [ :args | self new printTodayReference ]
]

{ #category : #accessing }
CrBaseCrono class >> useCronoFile [

	self activeClass: CrCronoFile
]

{ #category : #logging }
CrBaseCrono >> log: aString [

	self subclassResponsibility
]

{ #category : #logging }
CrBaseCrono >> review: daysRange [

	self 
		review: daysRange 
		to: self stdout
]

{ #category : #actions }
CrBaseCrono >> review: daysRange to: stream [

	self subclassResponsibility
]

{ #category : #accessing }
CrBaseCrono >> stdout [ 

	^ ZnNewLineWriterStream on: Stdio stdout
]
