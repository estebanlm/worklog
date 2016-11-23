private
printDailyReview
	| list lineEnding |

	lineEnding := OSPlatform current lineEnding.
	list := self crono review.
	list do: [ :each |
		self stdout << each key << ' '.
		(each value withNoLineLongerThan: 74) lines 
			do: [ :eachChunk | self stdout << eachChunk ]
			separatedBy: [ self stdout << lineEnding << '      ' ].
		self stdout << lineEnding ].
