actions
addPost
	<post>
	<path: '/add'>
	<consumes: 'text/plain'>
	<produces: 'application/json'>
	
	| text post |

	text := self request rawBody.
	text ifEmpty: [ ^ self responseError: 'No text log' ].
	
	post := (WLLog text: text) save.
	
	^ self responseOk: ('{1}, logged.' format: { post asString })