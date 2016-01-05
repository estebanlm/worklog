private
removePost: aString
	| response |
	[ response := self client remove: aString ]
	on: Error do: [ :e | self error: e messageText ].
	self inform: response.