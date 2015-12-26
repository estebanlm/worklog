handling
handleFiltered: aRequestContext
	(self authenticateRequest: aRequestContext request) 
		ifFalse: [ ^ self forbidden ].
	super handleFiltered: aRequestContext