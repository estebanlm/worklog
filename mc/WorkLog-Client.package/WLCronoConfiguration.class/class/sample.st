instance creation
sample
	"
	self configFileName asFileReference 
		writeStreamDo: [ :stream | STON put: self sample onStreamPretty: stream ]
	"
	^ self new 
		baseDir: '{home}/Dev/CronoLog';
		yourself