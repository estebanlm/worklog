private
exportAsChangeLog: aCollection
	| builder cr |
	
	cr := OSPlatform current lineEnding.
	builder := WLChangeLogBuilder rawLogs: aCollection.
	builder 
		withDateDo: [ :each |  
			Stdio stdout 
				<< each asString << ':' << cr
				<< (String new: (each asString size + 1) withAll: $-) << cr << cr ]
		withChangeLogDo: [ :each | Stdio stdout << (each withLineEndings: cr) ]
		separatedBy: [ Stdio stdout << cr << cr ]