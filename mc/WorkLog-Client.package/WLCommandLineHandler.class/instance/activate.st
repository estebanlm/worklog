activation
activate
	self activateHelpWithoutArguments ifTrue: [ ^ self ].
	
	(self argumentAt: 1) = '--add' ifTrue: [ ^ self activateAdd ].
	(self argumentAt: 1) = '--open-editor' ifTrue: [ ^ self activateOpen ].
	(self argumentAt: 1) = '--review' ifTrue: [ ^ self activateReview ]. 
	(self argumentAt: 1) = '--create-config' ifTrue: [ ^ self activateCreateConfig ]. 
	(self argumentAt: 1) = '--reset-server-config' ifTrue: [ ^ self activateResetServerConfig ]. 
	(self argumentAt: 1) = '--update-server' ifTrue: [ ^ self activateUpdateServer ].
	(self argumentAt: 1) = '--update-server-status' ifTrue: [ ^ self activateServerStatus ].
	(self argumentAt: 1) = '--update-client' ifTrue: [ ^ self activateUpdateClient ]. 
	(self argumentAt: 1) = '--remove' ifTrue: [ ^ self activateRemove ]. 
	
	self error: 'Not recognised: ', (self argumentAt: 1).