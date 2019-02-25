Extension { #name : #DateAndTime }

{ #category : #'*WorkLog-Server' }
DateAndTime >> asHuman [
	^ String streamContents: [ :stream |
		stream << self asDate asString << ' ' << self asTime printMinutes ]
]
