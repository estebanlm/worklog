activation
activateAdd
	
	(self hasOption: 'text') ifTrue: [ 
		self addPost: self text. 
		^ self quit ].
	(self hasOption: 'file') ifTrue: [ 
		self addPost: self fileContents. 
		^ self quit ].
	
	self error: 'You need to specify --text or --file.'
