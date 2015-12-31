*WorkLog-Server
asJson
	^ String streamContents: [ :stream |
		self javascriptOn: stream ]