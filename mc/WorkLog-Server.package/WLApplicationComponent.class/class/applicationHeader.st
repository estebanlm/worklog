accessing
applicationHeader
	^ WLServerConfiguration uniqueInstance header ifNil: [ WLServerConfiguration uniqueInstance user fullName , '''s log' ].