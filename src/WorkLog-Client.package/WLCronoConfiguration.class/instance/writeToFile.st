writing
writeToFile
	| reference |
	reference := self class configFileName asFileReference.
	reference exists ifTrue: [ 
		self error: ('There is already a configuration file at {1}/{2}.' 
			format: { 
				FileSystem workingDirectory fullName. 
				self class configFileName }) ]. 
	reference writeStreamDo: [ :stream | 
		STON put: self asJsonOnStreamPretty: stream ]