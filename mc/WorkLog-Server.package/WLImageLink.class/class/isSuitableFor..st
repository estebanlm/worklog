testing
isSuitableFor: aLink
	| contentType |
	
	contentType := (ZnClient new 
		url: aLink reference;
		head;
		response)
		contentType.
		
	^ contentType main = 'image'