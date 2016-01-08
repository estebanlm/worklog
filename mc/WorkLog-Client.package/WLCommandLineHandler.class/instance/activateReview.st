activation
activateReview
	| list |

	(self hasOption: 'lapse') ifFalse: [ self error: 'You need to specify --lapse.' ].

	[ list := self client review: self lapse ]
	on: Error do: [ :e | self error: e messageText ].
	self exportAsChangeLog: list.
	self quit.