instance creation
rawLogs: aCollection
	^ self basicNew 
		initializeRawLogs: aCollection;
		yourself