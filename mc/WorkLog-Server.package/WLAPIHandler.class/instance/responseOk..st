private
responseOk: aString 
	^ STON toJsonString: (Dictionary new 
		at: #status put: 'Ok';
		at: #message put: aString;
		yourself)
