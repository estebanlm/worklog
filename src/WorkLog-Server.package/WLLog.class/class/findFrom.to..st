accessing
findFrom: fromDate to: toDate 
	^ self sortLogs: (self selectMany: [ :each | (each date >= fromDate) & (each date <= toDate) ])