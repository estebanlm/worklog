private
registerApplication
	| app | 
	app := WAAdmin register: self asApplicationAt: self applicationPath.
   app
      addLibrary: JQDeploymentLibrary;
      addLibrary: JQUiDeploymentLibrary;
      addLibrary: TBSDeploymentLibrary