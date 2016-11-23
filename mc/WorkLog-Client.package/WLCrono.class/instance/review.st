accessing
review
	| lines |
	lines := OrderedCollection new: 500. 
	self dayReference readStreamDo: [ :stream | 
		stream contents linesDo: [ :each |
			lines add: (each first: 5) ->  (each allButFirst: 6) ] ].
	^ lines