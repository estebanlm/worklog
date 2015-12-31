private
basicUpdate
	self status: #updating.
	self lastErrorMessage: nil.
	[ self loadBaseline.
	  Smalltalk saveSession ]
	on: Error do: [ :e | 
		self lastErrorMessage: e messageText.
		^ self status: #error ].
	self lastUpdateDate: DateAndTime now.
	self status: #ok