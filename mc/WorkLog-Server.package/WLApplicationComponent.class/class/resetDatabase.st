private
resetDatabase
	self isProduction 
		ifTrue: [ self resetDatabaseForProduction ]
		ifFalse: [ self resetDatabaseForDevelopment ]