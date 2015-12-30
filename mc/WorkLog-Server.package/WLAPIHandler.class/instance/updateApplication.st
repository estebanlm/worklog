actions
updateApplication
	<get>
	<path: '/admin/update-application'> 
	<produces: 'application/json'>

	[ Metacello new 
		githubUser: 'estebanlm' project: 'worklog' commitish: 'master' path: 'mc';
		baseline: 'WorkLog';
		load.
	 Smalltalk saveSession ]
	on: Error do: [ :e | self responseError: e messageText ].
	
	^ self responseOk: 'Application updated.'.