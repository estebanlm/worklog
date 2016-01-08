testing
isSuitableFor: aLink
	^ aLink url asUrl host includesSubstring: 'stackoverflow.com' 