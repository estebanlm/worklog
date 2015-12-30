class initialization
initialize
	Smalltalk 
		removeFromStartUpList: self;
		addToStartUpList: self.
	self registerApplication.