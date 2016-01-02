accessing
permaLink
	^ String streamContents: [ :stream | 
		stream 
			<< '/' << WLApplicationComponent applicationPath
			<< '/' << self class path 
			<< '/' << self post permaLink  ]