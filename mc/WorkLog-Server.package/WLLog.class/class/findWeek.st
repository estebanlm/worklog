accessing
findWeek
	| day |
	day := (Date today - ((Date today dayOfWeek - 1) days)) + 1 day.
	^ self sortLogs: (self selectMany: [ :each | each date >= day ])