printing
stonOn: stonWriter
	stonWriter isJsonMode ifTrue: [ ^ self javascriptOn: stonWriter ].
	^ super stonOn: stonWriter
		 