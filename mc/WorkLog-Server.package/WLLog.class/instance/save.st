persistence
save
	self isNew ifTrue: [ permaLink := WLSequence nextPermaLinkNumber ].
	super save.
	
