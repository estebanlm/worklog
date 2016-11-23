*WorkLog-Client
logPrintTime
	^ String new: 5 streamContents: [ :stream | 
		self hour printOn: stream base: 10 length: 2 padded: true.
		stream nextPut: $:.
		self minute printOn: stream base: 10 length: 2 padded: true ]