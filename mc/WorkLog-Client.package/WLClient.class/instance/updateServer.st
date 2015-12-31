actions
updateServer
	| response |
	
	response := (self connectionTo: '/admin/update-application')
		get;
		response.
		
	^ self validateResponseAndAnswerMessage: response