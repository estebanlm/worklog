testing
isSuitableFor: aLink
	^ aLink url asUrl host includesSubstring: 'twitter.com' 