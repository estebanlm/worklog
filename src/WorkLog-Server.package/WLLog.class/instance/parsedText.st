accessing
parsedText
	^ parsedText ifNil: [ parsedText := PRDocument parser parse: self text ]