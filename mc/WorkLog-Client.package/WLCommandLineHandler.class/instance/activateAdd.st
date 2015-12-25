activation
activateAdd
	| response |
	(self hasOption: 'text') ifFalse: [ self error: 'You need to specify --text.' ].
	[ response := self client add: self text ]
	on: Error do: [ :e | self error: e messageText ].
	self inform: response.
	self quit.