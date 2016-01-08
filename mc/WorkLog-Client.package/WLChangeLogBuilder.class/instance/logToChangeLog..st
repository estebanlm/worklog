private
logToChangeLog: postDictionary
	| lines |
	lines := ((String streamContents: [ :stream | 
		(postDictionary at: 'text') linesDo: [ :each | 
			each trimBoth ifNotEmpty: [ stream << each; cr ] ] ])
			withNoLineLongerThan: 80)
			lines.
	^ String streamContents: [ :stream | 
			stream << ' *' << String tab << lines first; cr.
			lines allButFirst
				do: [ :each | stream << String tab << each ]
				separatedBy: [ stream cr ]]