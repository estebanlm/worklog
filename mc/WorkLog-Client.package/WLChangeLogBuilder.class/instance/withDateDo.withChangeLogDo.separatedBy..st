enumerating
withDateDo: dateBlock withChangeLogDo: logBlock separatedBy: separationBlock
	(self rawLogs 
		groupedBy: [ :each | (each at: 'date') asDate ])
		keysAndValuesDo: [ :date :logs | 
			dateBlock value: date.
			logs 
				do: [ :each | logBlock value: (self logToChangeLog: each) ]
				separatedBy: separationBlock ]
		