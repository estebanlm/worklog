accessing
title
	^ title ifNil: [ self user fullName, '''s log' ]