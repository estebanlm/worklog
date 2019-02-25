actions
remove: aString
	| response |
	
	response := (self connectionTo: 'remove')
		addPathSegment: aString;
		delete;
		response.
		
	^ self validateResponseAndAnswerMessage: response
	
	
	