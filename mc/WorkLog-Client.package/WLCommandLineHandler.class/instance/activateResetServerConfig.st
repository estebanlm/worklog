activation
activateResetServerConfig
	| response |
	[ response := self client resetServerConfig ]
	on: Error do: [ :e | self error: e messageText ].
	self inform: response.
	self quit