actions
resetServerConfig
	| response |
	
	response := (self connectionTo: '/admin/reset-server-config')
		get;
		response.
		
	^ self validateResponseAndAnswerMessage: response