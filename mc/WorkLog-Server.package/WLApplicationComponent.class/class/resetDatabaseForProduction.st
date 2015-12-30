private
resetDatabaseForProduction
	| config |
	config := WLServerConfiguration uniqueInstance.
	(VOMongoRepository 
		host: config host 
		port: config port 
		database: config database)
		enableSingleton