logging
log: aString
	| lineEnding |
	lineEnding := OSPlatform current lineEnding.
	self todayReference writeStreamDo: [ :stream |
		stream setToEnd.
		stream
			<< '# At ' << Time now logPrintTime << lineEnding
			<< aString << lineEnding ]