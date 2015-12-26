private
fetchNoPostsMessage
	| date time |
	
	date := Date today.
	time := Time now.
	
	time hour	 < 10
		ifTrue: [ ^ self class earlyInTheMorningMessage ].
	(#(1 7) includes: date dayOfWeek)
		ifTrue: [ ^ self class weekendMessage ].
	 
	^ self class nothingYetMessage
