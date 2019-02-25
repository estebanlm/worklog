accessing
nextPermaLinkNumber
	^ (self findOrCreateById: #permalink) nextNumber.
	