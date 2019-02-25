accessing
baseDirReference
	"I will interpret #baseDir to allow users to declare FileLocator positions (just in first 
	 segment of path). 
	 e.g. I can intepret {home}/Dev/CronoLog"
	^ self baseDir first = ${
		ifTrue: [ self baseDirReferenceWithLocator ]
		ifFalse: [ self baseDir asFileReference ]
	