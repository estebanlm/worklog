private
generateReferencedLinks
	| objects |
	
	objects := WLReferenceCollector new
		visit: self parsedText;
		objects.
	objects ifEmpty: [ ^ self ].
	referencedLinks := objects collect: #asReferencedObject.  
