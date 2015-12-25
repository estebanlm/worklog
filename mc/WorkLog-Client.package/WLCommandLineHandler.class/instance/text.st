accessing
text
	| text |
	text := self optionAt: 'text'.
	(text first = $" and: [ text last = $" ])
		ifTrue: [ text := text  copyFrom: 2 to: (text size - 1) ].
	^ text