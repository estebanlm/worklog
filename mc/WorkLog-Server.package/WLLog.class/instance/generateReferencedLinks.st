private
generateReferencedLinks
	| objects |
	
	objects := PRReferenceCollector new
		visit: self parsedText;
		objects.
	objects ifEmpty: [ ^ self ].
	referencedLinks := objects collect: #asReferencedObject.  
