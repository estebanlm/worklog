accessing
findLastWeek
	| startDay endDay |
	endDay := Week current asDate.
	startDay := endDay - 7 days.
	^ self sortLogs: (self selectMany: [ :each | (each date > startDay) & (each date <= endDay) ])