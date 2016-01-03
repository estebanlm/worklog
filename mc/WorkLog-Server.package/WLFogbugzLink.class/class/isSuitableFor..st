testing
isSuitableFor: aLink
	^ (aLink reference beginsWith: 'case:')
		or: [ aLink url asUrl host includesSubstring: 'fogbugz.com' ] 