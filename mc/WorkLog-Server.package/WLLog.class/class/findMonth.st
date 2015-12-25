accessing
findMonth
	| day |
	day := Date today asMonth asDate.
	^ self sortLogs: (self selectMany: [ :each | each date >= day ])