printing
printOn: stream 
	stream 
		<< (self permaLink ifNil: [ 'NO_PERMALINK_YET' ]) << ': '
		<< self dateAsHuman