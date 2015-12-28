accessing
parsedText
	self flag: #todo. "Cache this"
	^ PRDocumentParser parse: self text