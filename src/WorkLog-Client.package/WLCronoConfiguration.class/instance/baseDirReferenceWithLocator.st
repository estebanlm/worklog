private
baseDirReferenceWithLocator
	"I interpret first entry as a location: {home}, {desktop}, {preferences}, etc. 
	 (See FileLocator class for others)"
	| segments location |
	segments := self baseDir substrings: (DiskStore delimiter) asString.
	location := (segments first copyFrom: 2 to: (segments first size - 1)) asSymbol. 
	^ segments allButFirst 
		inject: (FileLocator origin: location) asFileReference
		into: [ :all :each | all / each ]