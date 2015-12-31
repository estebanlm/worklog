activation
activateServerStatus
	| response |
	[ response := self client updateStatus ]
	on: Error do: [ :e | self error: e messageText ].
	self inform: response.
	self quit