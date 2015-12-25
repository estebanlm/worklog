private
error: aString 
	| prefix |
	prefix := (aString beginsWith: 'Error:') 
		ifTrue: [ '' ] 
		ifFalse: [ 'Error: ' ].
	self exitFailure: prefix, aString