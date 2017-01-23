private
logToChangeLog: postDictionary
	^ String streamContents: [ :stream | | cr lines |
		cr := OSPlatform current lineEnding. 
		lines := (postDictionary at: 'asciiDoc') lines.
		stream << '*    ' << lines first << cr.
		lines allButFirst
			do: [ :each | stream << '    ' << each  ]
			separatedBy: [ stream << cr ] ]
		