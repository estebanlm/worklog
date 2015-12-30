persistence
save
	self isNew  ifTrue: [ 
		self generatePermaLink.
		self generateReferencedLinks. ].
	super save.
	
