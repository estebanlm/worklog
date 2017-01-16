accessing
review
	^ self todayReference readStreamDo: [ :stream | stream contents ].
	