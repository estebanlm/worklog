Class {
	#name : #CrGtkConfiguration,
	#superclass : #SpApplicationConfiguration,
	#category : #'Crono-Spec-Application'
}

{ #category : #private }
CrGtkConfiguration >> addProviderFromString: aString [

	(GtkCssProvider newFromString: aString) addForApplicationToDefaultScreen
]

{ #category : #configuring }
CrGtkConfiguration >> configureOSX: anApplication [

	self ensureAppearance: self macAppearanceName. 
	self installTheme: self macThemeName.
	self addProviderFromString: '.cronoText { font: 12pt "Monaco" }'
]

{ #category : #configuring }
CrGtkConfiguration >> configureUnix: anApplication [

	self unixThemeName 
		ifNotNil: [ :aName | self installTheme: aName ].
	self addProviderFromString: '.cronoText { font: 11pt "Monospace Regular" }'
]

{ #category : #configuring }
CrGtkConfiguration >> configureWindows: anApplication [

	self installTheme: self windowsThemeName.
	self addProviderFromString: '.cronoText { font: 10pt "Microsoft Sans Serif" }'
]

{ #category : #configuring }
CrGtkConfiguration >> ensureAppearance: aName [
	| currentAppearance appearance |

	currentAppearance := #NSAppearance inObjC currentAppearance. 
	currentAppearance name UTF8String = aName ifTrue: [ ^ self ].

	appearance := #NSAppearance inObjC appearanceNamed: (#NSString inObjC stringWithUTF8String: aName).
	#NSApplication inObjC sharedApplication setAppearance: appearance
]

{ #category : #private }
CrGtkConfiguration >> installTheme: aString [

	GtkSettings default themeName: aString
]

{ #category : #accessing }
CrGtkConfiguration >> macAppearanceName [

	^ 'NSAppearanceNameAqua'
]

{ #category : #accessing }
CrGtkConfiguration >> macThemeName [
		
	^ 'Sierra-light'
]

{ #category : #accessing }
CrGtkConfiguration >> unixThemeName [

	^ 'Adwaita'
]

{ #category : #accessing }
CrGtkConfiguration >> windowsThemeName [

	^ 'Windows-10-master'
]
