actions
updateApplication
	<get>
	<path: '/admin/update-application'> 
	<produces: 'application/json'>

	Metacello new 
		githubUser: 'estebanlm' project: 'worklog' commitish: 'master' path: 'mc';
		baseline: 'WorkLog';
		load.
	Smalltalk saveSession.
	
	^ self responseOk: 'Application updated.'.