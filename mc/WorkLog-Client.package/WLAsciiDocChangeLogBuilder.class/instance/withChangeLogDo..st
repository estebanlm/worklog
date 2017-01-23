enumerating
withChangeLogDo: aBlock
	self rawLogs 
		do: [ :each | aBlock value: (self logToChangeLog: each) ]