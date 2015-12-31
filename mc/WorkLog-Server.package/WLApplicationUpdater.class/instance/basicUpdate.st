private
basicUpdate
	self status: #updating.
	self lastErrorMessage: nil.
	[ self loadBaseline.
	  WorldState addDeferredUIMessage: [ Smalltalk saveSession ]]
	on: Error do: [ :e | 
		self lastErrorMessage: e messageText.
		^ self status: #error ].
	self lastUpdateDate: DateAndTime new.
	self status: #ok