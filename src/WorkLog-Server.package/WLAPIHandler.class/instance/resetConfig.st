actions
resetConfig
	<get>
	<path: '/admin/reset-config'> 
	<produces: 'application/json'>

	WLServerConfiguration installFromFileSystem.

	^ self responseOk: 'Configuration reloaded.'.