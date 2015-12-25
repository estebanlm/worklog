accessing
dateAsHuman
	^ String streamContents: [ :stream |
		stream << self date asDate asString << ' ' << self date asTime printMinutes ]