private
loadBaseline
	Metacello new 
		githubUser: 'estebanlm' project: 'worklog' commitish: 'master' path: 'mc';
		baseline: 'WorkLog';
		load: 'server'.