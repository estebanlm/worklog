private
loadBaseline
	Metacello new 
		githubUser: 'estebanlm' project: 'worklog' commitish: 'master' path: 'mc';
		baseline: 'WorkLog';
		silently;
		ignoreImage;
		onLock: [ :e | e allow ];
		onUpgrade: [ :e | e allow ];
		onConflict: [ :e | e allow ];
		load: 'server'.