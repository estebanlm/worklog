testing
isSuitableFor: aLink
	^ aLink url asUrl host includesSubstring: 'wordpress.com' 