visiting
visitScript: aScript
	| language params |
	
	aScript hasLabel
		ifTrue: [ self createAnchorWith: aScript label ].
	
	params := ''.
	language := self languageForScript: aScript.
	language isSyntaxHighlightingPossible
		ifTrue: [ params := 'source,', language  printString, ','].
	(self getStringForAll: aScript caption children) ifNotEmpty: [ :caption |
		stream << '[' << params << 'caption="' << caption << '"]'.
		canvas newLine ].
	stream << '----'.
	canvas newLine.
	stream << [ self visitText: aScript ].
	canvas newLine.
	stream << '----'.
	canvas newLine.
	