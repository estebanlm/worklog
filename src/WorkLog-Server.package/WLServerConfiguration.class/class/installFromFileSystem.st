instance creation
installFromFileSystem
	| newConfiguration reference |
	reference := self configFileName asFileReference.
	reference exists 
		ifFalse: [ self error: 'I cannot find ', reference fullName, ' configuration file.' ].
	reference readStreamDo: [ :stream | 
		newConfiguration := STON fromStream: stream ].

	uniqueInstance := newConfiguration.