instance creation
uniqueInstance 
	^ uniqueInstance ifNil: [ 
		self installFromFileSystem.
		uniqueInstance ]