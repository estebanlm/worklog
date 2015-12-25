class initialization
initialize
	| app | 
	app := WAAdmin register: self asApplicationAt: 'web'.
   app
      addLibrary: JQDeploymentLibrary;
      addLibrary: JQUiDeploymentLibrary;
      addLibrary: TBSDeploymentLibrary