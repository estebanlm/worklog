accessing
parsedText
	^ parsedText ifNil: [ parsedText := PRDocumentParser parse: self text ]