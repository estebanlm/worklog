accessing
applicationTitle
	^ WLServerConfiguration uniqueInstance title ifNil: [ 
		WLServerConfiguration uniqueInstance user fullName , '''s log' ]