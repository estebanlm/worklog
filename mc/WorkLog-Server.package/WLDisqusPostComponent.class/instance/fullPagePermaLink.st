accessing
fullPagePermaLink
	^ String streamContents: [ :stream | 
		stream 
			<< WLServerConfiguration uniqueInstance url
			<< '/' << self class path 
			<< '/' << self post permaLink  ]