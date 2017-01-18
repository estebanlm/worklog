private
resetDatabaseForProduction
	| config |
	config := WLServerConfiguration uniqueInstance.
	(VOMongoRepository 
		host: config host 
		port: (config port ifNil: [ VOMongoRepository defaultPort ])
		database: config database)
		enableSingleton