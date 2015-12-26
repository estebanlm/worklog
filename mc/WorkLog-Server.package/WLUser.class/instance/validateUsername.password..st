testing
validateUsername: anUsername password: aPassword
	^ self username = anUsername 
		and: [ self password = aPassword ]