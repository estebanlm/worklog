actions
updateStatus
	| response |
	
	response := (self connectionTo: '/admin/update-status')
		get;
		response.
		
	^ self validateResponse: response