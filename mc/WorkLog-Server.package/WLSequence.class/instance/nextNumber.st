accessing
nextNumber
	self number: self number + 1.
	self save.
	^ self number