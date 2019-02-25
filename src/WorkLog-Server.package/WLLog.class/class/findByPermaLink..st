accessing
findByPermaLink: aNumber
	^ self selectOne: [ :each | each permaLink = aNumber ]