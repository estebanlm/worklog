instance creation
link: aLink
	^ (self suitableClassFor: aLink) basicNew
		initializeLink: aLink;
		yourself