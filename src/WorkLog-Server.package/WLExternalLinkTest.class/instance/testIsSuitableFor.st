tests
testIsSuitableFor
	self urlsToTest do: [ :each |
		self assert: (self linkClass isSuitableFor: (self linkTo: each)) ] 