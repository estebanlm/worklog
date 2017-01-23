enumerating
withDateDo: dateBlock withChangeLogDo: logBlock separatedBy: separationBlock
	^ self 
		withDateDo: dateBlock 
		withChangeLogDo: logBlock 
		separatedBy: separationBlock
		dateSeparatedBy: separationBlock