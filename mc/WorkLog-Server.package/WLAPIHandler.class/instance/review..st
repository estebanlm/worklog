actions
review: aString
	"day/week/month"
	<get>
	<path: '/review/{aString}'> 
	<produces: 'application/json'>

	aString = 'day' ifTrue: [ ^ self responseOkWith: 'list' value: WLLog findDay ].
	aString = 'week' ifTrue: [ ^ self responseOkWith: 'list' value: WLLog findWeek ].
	aString = 'month' ifTrue: [ ^ self responseOkWith: 'list' value: WLLog findMonth ].
	
	^ self notFound