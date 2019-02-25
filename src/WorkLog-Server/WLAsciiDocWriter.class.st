Class {
	#name : #WLAsciiDocWriter,
	#superclass : #PRAsciiDocWriter,
	#category : 'WorkLog-Server-Model'
}

{ #category : #visiting }
WLAsciiDocWriter >> visitEmptyParagraph: anObject [
	"Do nothing... is empty after all"
]

{ #category : #visiting }
WLAsciiDocWriter >> visitOrderedList: anObject [
	super visitOrderedList: anObject.
	canvas newLine.
]

{ #category : #visiting }
WLAsciiDocWriter >> visitScript: aScript [
	| language params |
	
	aScript hasLabel
		ifTrue: [ self createAnchorWith: aScript label ].
	
	params := ''.
	language := self languageForScript: aScript.
	language isSyntaxHighlightingPossible
		ifTrue: [ params := 'source,', language  printString, ','].
	(self getStringForAll: aScript caption children) ifNotEmpty: [ :caption |
		stream << '[' << params << 'caption="' << caption << '"]'.
		canvas newLine ].
	stream << '----'.
	canvas newLine.
	stream << [ self visitText: aScript ].
	canvas newLine.
	stream << '----'.
	canvas newLine.
	
]

{ #category : #visiting }
WLAsciiDocWriter >> visitUnorderedList: anObject [
	super visitUnorderedList: anObject.
	canvas newLine.
]
