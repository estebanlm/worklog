accessing
textAsHTML
	^ [ PRHTMLWriter write: self parsedText ]
		on: PRError do: [ :e | self text ].