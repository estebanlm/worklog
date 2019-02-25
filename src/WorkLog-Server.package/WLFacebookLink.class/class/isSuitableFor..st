testing
isSuitableFor: aLink
	^ aLink url asUrl host includesSubstring: 'facebook.com' 