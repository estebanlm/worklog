accessing
dayReference
	^ (self baseDirReference / Date today yyyymmdd) withExtension: 'txt' 