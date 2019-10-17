"
I'm a small tool to keep a daily log. 
I don't know if I will be useful, but Esteban sometimes wants to keep track of all stupid actions he do, without needing to publish them each time (ideally, he will be publishing a digest of this, using WorkLog ).

So far, I just know ==#log:==, which appends an entry to the daily log.

"
Class {
	#name : #WLCrono,
	#superclass : #Object,
	#category : #'WorkLog-Client-Model'
}

{ #category : #accessing }
WLCrono class >> commandLine [
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

{ #category : #accessing }
WLCrono class >> commandLineAdd [

	^ (ClapCommand withName: 'add')
		description: 'Log some work.';
		add: ((ClapPositional withName: 'LOG') 
			description: 'The work to log.';
			multiple: true);
		meaning: [ :args | self new log:  (' ' join: (args occurrencesNamed: 'LOG' collect: #value)) ]
]

{ #category : #accessing }
WLCrono class >> commandLineReview [

	^ (ClapCommand withName: 'review')
		description: 'Review crono worklog dates.';
		add: ((ClapPositional withName: 'range') implicitMeaning: [ '0' ]);
		meaning: [ :args | self new review: (WLCronoRange fromString: (args atName: 'range') value) ]
]

{ #category : #accessing }
WLCrono class >> commandLineTodayReference [

	^ (ClapCommand withName: 'todayReference')
		description: 'Prints path of current using file.';
		meaning: [ :args | self new printTodayReference ]
]

{ #category : #accessing }
WLCrono >> baseDirReference [

	^ WLCronoConfiguration readFromFileSystem baseDirReference
		ensureCreateDirectory;
		yourself
	
]

{ #category : #logging }
WLCrono >> log: aString [
	| nl |

	nl := OSPlatform current lineEnding.
	self todayReference writeStreamDo: [ :stream | | lines |
		stream setToEnd.
		stream << Time now logPrintTime << ' '.
		lines := (aString withNoLineLongerThan: 94) lines.
		stream << lines first << nl.
		lines allButFirstDo: [ :each | stream << '      ' << each << nl ] ].
	
	self stdout << 'You work, therefore you are.'; newLine
]

{ #category : #accessing }
WLCrono >> printTodayReference [

	self stdout << self todayReference fullName; newLine
]

{ #category : #accessing }
WLCrono >> referenceOfDay: aDate [

	^ (self baseDirReference / aDate yyyymmdd) withExtension: 'txt' 
]

{ #category : #accessing }
WLCrono >> review: daysRange [

	self 
		review: daysRange 
		to: self stdout
]

{ #category : #accessing }
WLCrono >> review: daysRange to: stream [

	daysRange days 
		do: [ :each | | dayRef |
			stream << each ddmmyyyy; newLine. 
			dayRef := self referenceOfDay: each.
			stream << (dayRef exists 
				ifTrue: [ dayRef contents ]
				ifFalse: [ 'No records' ]) ]
		separatedBy: [ 
			stream newLine ]
]

{ #category : #accessing }
WLCrono >> stdout [ 

	^ ZnNewLineWriterStream on: Stdio stdout
]

{ #category : #accessing }
WLCrono >> todayReference [

	^ self referenceOfDay: Date today
]
