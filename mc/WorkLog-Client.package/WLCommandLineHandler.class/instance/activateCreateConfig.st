activation
activateCreateConfig
	[ WLClientConfiguration sample writeToFile.
	  self inform: WLClientConfiguration configFileName, ' created.' ]
	on: Error do: [ :e | self error: e messageText ].
	self quit.	