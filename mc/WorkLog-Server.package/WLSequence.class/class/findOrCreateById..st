accessing
findOrCreateById: aSymbol
	^ (self selectOne: [ :each | each id = aSymbol ])
		ifNil: [ (self id: aSymbol) save ]
	