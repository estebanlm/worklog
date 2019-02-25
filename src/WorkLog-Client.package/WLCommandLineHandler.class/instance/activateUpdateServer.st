activation
activateUpdateServer
	| response |
	[ response := self client updateServer ]
	on: Error do: [ :e | self error: e messageText ].
	self inform: response.
	self quit