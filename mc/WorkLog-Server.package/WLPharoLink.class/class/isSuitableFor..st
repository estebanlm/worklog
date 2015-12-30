testing
isSuitableFor: aLink
	| host |
	host := aLink url asUrl host.
	^ (host includesSubstring: 'pharo.org')
		"Technically this is not a pharo link, but a cog (or squeak)... 
		 but well, this is easiest :)"
		or: [ host includesSubstring: 'squeakfoundation.org' ]