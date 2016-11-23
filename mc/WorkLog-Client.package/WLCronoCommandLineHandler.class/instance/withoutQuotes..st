private
withoutQuotes: aString
	^ (aString first = $" and: [ aString last = $" ])
		ifTrue: [ aString  copyFrom: 2 to: (aString size - 1) ]
		ifFalse: [ aString ]
