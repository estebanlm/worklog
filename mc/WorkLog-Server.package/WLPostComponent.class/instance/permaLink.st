accessing
permaLink
	| request |
	request := self requestContext request.
	^ String streamContents: [ :stream | 
		stream 
			<< '/' << request uri path first 
			<< '/' << self class path 
			<< '/' << self post permaLink  ]