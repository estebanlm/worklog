tests
testNew
	| log |
	
	log := WLLog new.
	self assert: log text isNil.
	self assert: log date notNil.
	self assert: log date asDate equals: Date today.