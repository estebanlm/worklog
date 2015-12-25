actions
accept 
	self textArea accept.
	[ 
		self client add: self textArea text asString.
		self window close ]
	on: Error do: [ :e | self alert: 'Error: ', e messageText ]
	