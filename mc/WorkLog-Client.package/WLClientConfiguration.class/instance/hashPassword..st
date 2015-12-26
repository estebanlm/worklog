accessing
hashPassword: aString
	^ self password: (MD5 hashMessage:  aString) asInteger asString