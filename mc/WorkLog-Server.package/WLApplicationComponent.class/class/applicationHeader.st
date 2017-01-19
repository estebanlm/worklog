accessing
applicationHeader
	^ WLServerConfiguration uniqueInstance header 
		ifNil: [ self applicationTitle ].