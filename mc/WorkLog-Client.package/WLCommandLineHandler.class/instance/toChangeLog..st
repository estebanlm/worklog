private
toChangeLog: postDictionary
	| lines |
	lines := (postDictionary at: 'text') withNoLineLongerThan: 80.
	^ String streamContents: [ :stream | 
			stream << ' * ' << lines first.
			lines allButFirst
				do: [ :each | stream << '   ' << each ]
				separatedBy: [ stream cr ]]
	