printing
javascriptOn: stream 
	^ Dictionary new 
		at: 'date' put: self dateAsHuman;
		at: 'text' put: self text;
		stonOn: stream