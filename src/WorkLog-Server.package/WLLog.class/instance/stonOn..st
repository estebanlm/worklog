printing
stonOn: stonWriter
	stonWriter isJsonMode ifTrue: [ ^ self jsonOn: stonWriter ].
	^ super stonOn: stonWriter
		 