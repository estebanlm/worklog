activation
activateAdd
	
	(self hasOption: 'text') ifTrue: [ 
		self addLog: self text. 
		^ self quit ].
	(self hasOption: 'file') ifTrue: [ 
		self addLog: self fileContents. 
		^ self quit ].
	
	self error: 'You need to specify --text or --file.'
