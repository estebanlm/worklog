handling
authenticateRequest: request 
	^ WLServerConfiguration uniqueInstance user
		validateUsername: request user
		password: request password
	