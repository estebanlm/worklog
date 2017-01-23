accessing
findLastWeek
	| startDay endDay |
	endDay := Week current asDate.
	startDay := endDay - 7 days.
	^ self findFrom: (endDay + 1 day) to: startDay 