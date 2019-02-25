*WorkLog-Server
asHuman
	^ String streamContents: [ :stream |
		stream << self asDate asString << ' ' << self asTime printMinutes ]