accessing
sample
	"
	self configFileName asFileReference 
		writeStreamDo: [ :stream | STON put: self sample onStreamPretty: stream ]
	"
	^ self new 
		host: 'localhost'; 			"Optional"
		port: 27017;						"Optional"
		database: 'johndoe-log';		
		user: (WLUser new 
			username: 'johndoe';
			hashPassword: 'secret';
			yourself);
		yourself