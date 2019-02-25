accessing
findWeek
	| day |
	day := Week current asDate.
	"Week starts in sunday and I want it on monday so I check for bigger and not bigger and equals"
	^ self sortLogs: (self selectMany: [ :each | each date > day ])