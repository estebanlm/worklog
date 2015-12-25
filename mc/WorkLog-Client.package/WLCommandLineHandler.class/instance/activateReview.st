activation
activateReview
	| list |

	(self hasOption: 'lapse') ifFalse: [ self error: 'You need to specify --lapse.' ].
	[ list := self client review: self lapse ]
	on: Error do: [ :e | self error: e messageText ].

	list 
		do: [ :each |
			Stdio stdout 
				<< (each at: #date) << ':'; lf; cr;
				<< ((each at: #text) withNoLineLongerThan: 80); lf; cr ]
		separatedBy: [ 
			Stdio stdout << '---'; lf; cr ].
	
	self quit.