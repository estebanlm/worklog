actions
add: aString 
	| response |
	
	response := (self connectionTo: 'add')
		entity: (ZnEntity text: aString);
		contentType: ZnMimeType textPlain;
		post;
		response.
		
	^ self validateResponseAndAnswerMessage: response