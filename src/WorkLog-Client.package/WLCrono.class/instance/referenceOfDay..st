accessing
referenceOfDay: aDate
	^ (self baseDirReference / aDate yyyymmdd) withExtension: 'md' 