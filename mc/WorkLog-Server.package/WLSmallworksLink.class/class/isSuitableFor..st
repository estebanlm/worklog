testing
isSuitableFor: aLink
	^ aLink url asUrl host includesSubstring: 'smallworks.eu' 