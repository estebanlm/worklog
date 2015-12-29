accessing
routes 
	^ routes ifNil: [ routes := self createRoutes ]