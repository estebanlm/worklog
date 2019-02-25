enumerating
withDateDo: dateBlock withChangeLogDo: logBlock separatedBy: separationBlock dateSeparatedBy: dateSeparationBlock
	| logsByDate |
	logsByDate := self rawLogs groupedBy: [ :each | (each at: 'date') asDate ].
	(logsByDate associations sorted: [ :a :b | a key > b key ])
		do: [ :eachAssoc | | date logs |
			date := eachAssoc key. 
			logs := eachAssoc value. 
			dateBlock value: date.
			logs 
				do: [ :each | logBlock value: (self logToChangeLog: each) ]
				separatedBy: separationBlock ]
		separatedBy: dateSeparationBlock