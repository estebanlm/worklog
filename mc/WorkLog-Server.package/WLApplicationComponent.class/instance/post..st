routes
post: idString
	<get>
	<path: '/post/{idString}'>
	| log |
	log := (WLLog findByPermaLink: idString asNumber) ifNil: [ ^ nil ].
	^ WLPostComponent post: log