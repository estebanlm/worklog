testing
isSuitableFor: aLink
	^ aLink url asUrl host includesSubstring: 'bitbucket.org' 