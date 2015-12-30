system startup
startUp: resuming
	resuming ifFalse: [ ^ self ].
	WLServerConfiguration installFromFileSystem.
	self resetDatabase.