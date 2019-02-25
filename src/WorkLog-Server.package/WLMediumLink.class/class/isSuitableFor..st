testing
isSuitableFor: aLink
	^ aLink url asUrl host includesSubstring: 'medium.com' 