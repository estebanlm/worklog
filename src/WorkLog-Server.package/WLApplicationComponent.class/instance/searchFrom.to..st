routes
searchFrom: fromString to: toString
	<get>
	<path: '/search?from={fromString}&to={toString}'>
	
	^ self createSearchComponentFrom: fromString asDateDMY to: toString asDateDMY