logging
log: aString
	self dayReference writeStreamDo: [ :stream |
		stream setToEnd.
		stream
			<< Time now logPrintTime
			<< ' ' 
			<< aString
			<< OSPlatform current lineEnding ]