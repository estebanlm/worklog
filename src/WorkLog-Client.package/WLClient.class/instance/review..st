actions
review: aString 
	"aString can be 'day', 'week', 'lastWeek' or 'month'"
	| response |
	
	response := (self connectionTo: 'review')
		addPathSegment: aString;
		get;
		response.
		
	^ (self validateResponse: response) at: #list.
	
	