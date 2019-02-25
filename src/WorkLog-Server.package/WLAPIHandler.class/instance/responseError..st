private
responseError: aString	
	^ STON toJsonString: (Dictionary new 
		at: #status put: 'Error';
		at: #message put: aString;
		yourself)

