private
addPost: aString
	| response |
	[ response := self client add: aString ]
	on: Error do: [ :e | self error: e messageText ].
	self inform: response.
