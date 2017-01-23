actions
searchFrom: fromString to: toString
	<get>
	<path: '/search?from={fromString}&to={toString}'> 
	<produces: 'application/json'>
	
	| fromDate toDate |
	
	fromDate := fromString asDateDMY.
	toDate := toString asDateDMY.	
	^ self 
		responseOkWith: 'list' 
		value: (WLLog findFrom: fromDate to: toDate) asArray
