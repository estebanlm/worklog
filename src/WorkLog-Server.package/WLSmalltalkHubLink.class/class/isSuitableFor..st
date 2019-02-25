testing
isSuitableFor: aLink
	^ aLink url asUrl host includesSubstring: 'smalltalkhub.com' 