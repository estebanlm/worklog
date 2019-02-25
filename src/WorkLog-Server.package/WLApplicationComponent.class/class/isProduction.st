testing
isProduction
	| config |
	production
		ifNil:
			[ 
				config := WLServerConfiguration uniqueInstance.
				config production
					ifNotNil: [ production := config production ]
					ifNil: [ production := false ] ].
	^ production