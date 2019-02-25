printing
jsonOn: stream 
	^ Dictionary new 
		at: 'permaLink' put: self permaLink;
		at: 'date' put: self dateAsHuman;
		at: 'text' put: (PRTextWriter write: self parsedText);
		at: 'asciiDoc' put: (WLAsciiDocWriter write: self parsedText);
		stonOn: stream