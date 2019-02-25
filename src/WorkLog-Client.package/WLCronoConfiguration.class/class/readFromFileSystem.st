instance creation
readFromFileSystem
	| reference |
	reference := self configFileName asFileReference.
	reference exists ifFalse: [ ^ self new ].
	^ reference readStreamDo: [ :stream | 
		STON fromStream: stream  ]