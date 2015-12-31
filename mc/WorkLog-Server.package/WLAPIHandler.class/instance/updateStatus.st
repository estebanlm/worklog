actions
updateStatus
	<get>
	<path: '/admin/update-status'> 
	<produces: 'application/json'>
	| update |
	
	update := WLApplicationUpdater uniqueInstance.
	^ self responseOkWith: (Dictionary new 
		at: #'updateStatus' put: update status;
		at: #'lastUpdateDate' put: update lastUpdateDate;
		at: #'lastUpdateError' put: update lastErrorMessage;
		yourself).