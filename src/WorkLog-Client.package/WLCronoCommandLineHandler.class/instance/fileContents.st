private
fileContents
	| fileName reference |
	fileName := self withoutQuotes: (self optionAt: 'file').
	reference := fileName asFileReference. 
	reference exists 
		ifFalse: [ self error: ('File {1} does not exists.' format: { reference fullName }) ].
	^ reference readStreamDo: [ :stream |
		stream contents ]