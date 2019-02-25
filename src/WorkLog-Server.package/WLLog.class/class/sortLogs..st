private
sortLogs: aCollection
	^ aCollection sorted: [ :a :b | b date < a date ]