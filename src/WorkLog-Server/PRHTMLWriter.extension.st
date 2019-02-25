Extension { #name : #PRHTMLWriter }

{ #category : #'*WorkLog-Server-Model-Pier' }
PRHTMLWriter >> visitFogbugzLink: aLink [
	canvas tag
		name: 'a';
		parameterAt: 'href' put: aLink url;
		with: aLink alias
]
