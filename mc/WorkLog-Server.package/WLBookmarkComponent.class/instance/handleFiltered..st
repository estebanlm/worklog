private
handleFiltered: aRequestContext
	| route |
	route := self routeForContext: aRequestContext ifAbsent: [ ^ self ].
	self content: (self executeResult: route).
	