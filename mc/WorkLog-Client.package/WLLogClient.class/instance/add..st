actions
add: aString 
	(self connectionTo: 'add')
		entity: (ZnEntity text: aString);
		contentType: ZnMimeType textPlain;
		post.
		