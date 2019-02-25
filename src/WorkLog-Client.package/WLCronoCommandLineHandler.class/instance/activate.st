activation
activate
	self activateHelpWithoutArguments ifTrue: [ ^ self ].
	
	(self argumentAt: 1) = '--add' ifTrue: [ ^ self activateAdd ].
	(self argumentAt: 1) = '--review' ifTrue: [ ^ self activateReview ]. 
	(self argumentAt: 1) = '--todayReference' ifTrue: [ ^ self activateTodayReference ]. 

	self error: 'Not recognised: ', (self argumentAt: 1).