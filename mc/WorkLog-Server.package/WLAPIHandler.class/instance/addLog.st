actions
addLog
	<post>
	<path: '/add'>
	<consumes: 'text/plain'>
	<produces: 'application/json'>
	
	| text log |

	text := self request rawBody.
	text ifEmpty: [ ^ self responseError: 'No text log' ].
	
	log := (WLLog text: text) save.
	
	^ self responseOk: ('{1}, logged.' format: { log asString })