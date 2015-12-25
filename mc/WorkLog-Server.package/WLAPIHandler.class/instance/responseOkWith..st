private
responseOkWith: aDictionary 
	^ STON toJsonString: (Dictionary new 
		at: #status put: 'Ok';
		addAll: aDictionary;
		yourself)
