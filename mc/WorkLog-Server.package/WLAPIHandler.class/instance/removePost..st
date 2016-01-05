actions
removePost: aString
	<delete>
	<path: '/remove/{aString}'> 
	<produces: 'application/json'>
	| post |
	
	post := WLLog findByPermaLink: aString asNumber.	
	post ifNil: [ ^ self notFound ].
	
	post remove.
	
	^ self responseOk: ('{1}, removed.' format: { post asString })

	