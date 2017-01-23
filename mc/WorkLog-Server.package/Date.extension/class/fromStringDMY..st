*WorkLog-Server
fromStringDMY: aString
	"Parses dd/mm/yyyy"
	| parsed day month year |
	parsed := aString substrings: '/'.
	parsed size ~= 3 ifTrue: [ self error: 'Invalid format.' ].
	
	day := parsed first asInteger.
	month := parsed second asInteger.
	year := parsed third asInteger.
	
	^ Date year: year month: month day: day 