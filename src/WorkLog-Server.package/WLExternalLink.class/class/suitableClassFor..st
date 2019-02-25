private
suitableClassFor: aLink 
	^ (self allSubclasses 
		sorted: [ :a :b | a priority < b priority ])
		detect: [ :each | each isSuitableFor: aLink ] 