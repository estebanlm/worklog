actions
searchFrom: fromString to: toString 
	"from/to strings are of the form 'd/m/y'"
	| response |
	
	response := (self connectionTo: 'search')
		queryAt: 'from' put: fromString;
		queryAt: 'to' put: toString;
		get;
		response.
		
	^ (self validateResponse: response) at: #list.
	
	