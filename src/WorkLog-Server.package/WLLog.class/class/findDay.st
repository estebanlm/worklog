accessing
findDay
	| day nextDay |
	day := Date today asDateAndTime.
	nextDay := (Date today + 1 day) asDateAndTime.
	^ self sortLogs: (self selectMany: [ :each | (each date >= day) & (each date < nextDay) ])