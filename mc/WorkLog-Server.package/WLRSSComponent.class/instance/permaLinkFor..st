accessing
permaLinkFor: aPost
	^ String streamContents: [ :stream |
		stream 
			<< self config url 
			<< '/' << WLPostComponent path 
			<< '/' << aPost permaLink asString ]