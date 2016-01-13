accessing
sample
	"
	self configFileName asFileReference 
		writeStreamDo: [ :stream | STON put: self sample onStreamPretty: stream ]
	"
	^ self new 
		host: 'localhost'; 			"Optional"
		port: 27017;						"Optional"
		production: true;           "Optional"						
		title: 'My Worklog';
		url: 'http://localhost:8080';
		header: 'My Worklog';       "Optional"
		disqusAccount: 'johndoe-worklog';
		database: 'johndoe-log';	
		user: (WLUser new 
			username: 'johndoe';
			hashPassword: 'secret';
			fullName: 'John Doe';
			gravatarUrl: 'https://secure.gravatar.com/gravatar/123456789';
			yourself);
		yourself