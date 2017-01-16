actions
review: aString
	"day/week/month"
	<get>
	<path: '/review/{aString}'> 
	<produces: 'application/json'>

	aString = 'day' ifTrue: [ ^ self responseOkWith: 'list' value: WLLog findDay asArray ].
	aString = 'week' ifTrue: [ ^ self responseOkWith: 'list' value: WLLog findWeek asArray ].
	aString = 'lastWeek' ifTrue: [ ^ self responseOkWith: 'list' value: WLLog findLastWeek asArray ].
	aString = 'month' ifTrue: [ ^ self responseOkWith: 'list' value: WLLog findMonth asArray ].
	
	^ self notFound