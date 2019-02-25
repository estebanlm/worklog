private
connectionTo: aString
	| config |
	config := WLClientConfiguration readFromFileSystem. 
	^ ZnClient new 
		beOneShot;
		url: config url;
		username: config username password: config password;
		addPathSegment: aString;
		yourself
		
		