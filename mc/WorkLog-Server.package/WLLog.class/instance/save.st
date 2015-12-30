persistence
save
	self isNew  ifTrue: [ 
		self permaLink ifNil: [ self generatePermaLink ].
		self generateReferencedLinks. ].
	super save.
	
