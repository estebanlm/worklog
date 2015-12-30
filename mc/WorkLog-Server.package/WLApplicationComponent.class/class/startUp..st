system startup
startUp: resuming
	resuming ifFalse: [ ^ self ].
	self resetDatabase.