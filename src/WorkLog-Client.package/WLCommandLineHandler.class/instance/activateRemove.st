activation
activateRemove
	
	(self hasOption: 'id') ifFalse: [ self error: 'You need to specify --id.' ].
	self removePost: self id. 	
	^ self quit
	
	
