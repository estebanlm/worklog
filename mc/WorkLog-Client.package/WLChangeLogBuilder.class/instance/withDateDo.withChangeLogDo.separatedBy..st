enumerating
withDateDo: dateBlock withChangeLogDo: logBlock separatedBy: separationBlock
	((self rawLogs 
		groupedBy: [ :each | (each at: 'date') asDate ]) 
		associations)
			do: [ :eachAssoc | | date logs |
				date := eachAssoc key. 
				logs := eachAssoc value. 
				dateBlock value: date.
				logs 
					do: [ :each | logBlock value: (self logToChangeLog: each) ]
					separatedBy: separationBlock ]
			separatedBy: separationBlock