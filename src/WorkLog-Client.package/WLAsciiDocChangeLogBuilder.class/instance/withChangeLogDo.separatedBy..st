enumerating
withChangeLogDo: aBlock separatedBy: separationBlock
	^ self rawLogs 
		do: [ :each | aBlock value: (self logToChangeLog: each) ]
		separatedBy: separationBlock