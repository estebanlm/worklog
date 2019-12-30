"
I'm a small tool to keep a daily log. 
I don't know if I will be useful, but Esteban sometimes wants to keep track of all stupid actions he does, without needing to publish them each time (ideally, he will be publishing a digest of this, using WorkLog).

So far, I just know ==#log:==, which appends an entry to the daily log.
"
Class {
	#name : #CrCronoFile,
	#superclass : #CrBaseCrono,
	#category : #'Crono-Model'
}

{ #category : #logging }
CrCronoFile >> log: aString [
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
CrCronoFile >> logReference [

	^ CrCronoConfiguration readFromFileSystem logReference	
]

{ #category : #accessing }
CrCronoFile >> printTodayReference [

	self stdout << self todayReference fullName; newLine
]

{ #category : #accessing }
CrCronoFile >> referenceOfDay: aDate [

	^ (self logReference / aDate yyyymmdd) withExtension: 'txt' 
]

{ #category : #accessing }
CrCronoFile >> review: daysRange to: stream [

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
CrCronoFile >> todayReference [

	^ self referenceOfDay: Date today
]
