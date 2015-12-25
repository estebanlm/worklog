private
validateResponse: response
	| jsonResult |

	response isError 
		ifTrue: [ ^ self error: 'Server error ', response code asString ].
		
	jsonResult := STON fromString: response contents.
	((jsonResult at: #status) = 'Error')
 		ifTrue: [ ^ self error: (jsonResult at: #message) ].

	^ jsonResult		
	