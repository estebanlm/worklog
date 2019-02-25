actions
updateApplication
	<get>
	<path: '/admin/update-application'> 
	<produces: 'application/json'>

	WLApplicationUpdater uniqueInstance update.

	^ self responseOk: 'Application update started.'.