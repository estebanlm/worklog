testing
isSuitableFor: aLink
	^ aLink url asUrl host includesSubstring: 'github.com' 