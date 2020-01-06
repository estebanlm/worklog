"
I am a configuration for the Crono application to be used with Gtk backend. 
I define a light theme.
"
Class {
	#name : #CrGtkConfiguration,
	#superclass : #SpGtkConfiguration,
	#instVars : [
		'iconProvider'
	],
	#category : #'Crono-View-Application'
}

{ #category : #configuring }
CrGtkConfiguration >> configureOSX: anApplication [

	self ensureAppearance: self macAppearanceName. 
	self installTheme: self macThemeName.
	self addCSSProviderFromString: '
.cronoText { font: 12pt "Monaco" }
.title { /*font-size: 14pt;*/ font-weight: bold }
.titleShortcut { color: LightSlateGrey }
.list { padding: 5px }
.markFocus { margin-right: 3px }'
]

{ #category : #configuring }
CrGtkConfiguration >> configureUnix: anApplication [

	self unixThemeName 
		ifNotNil: [ :aName | self installTheme: aName ].
	self addCSSProviderFromString: '
.cronoText { font: 11pt "Monospace Regular" }
.title { font-size: 14pt }
.titleShortcut { color: LightSlateGrey }
.list { padding: 5px }
.markFocus { margin-right: 3px }'
]

{ #category : #configuring }
CrGtkConfiguration >> configureWindows: anApplication [

	self installTheme: self windowsThemeName.
	self addCSSProviderFromString: '
.cronoText { font: 10pt "Microsoft Sans Serif" }
.title { font-size: 14pt }
.titleShortcut { color: LightSlateGrey }
.list { padding: 5px }
.markFocus { margin-right: 3px }'
]

{ #category : #configuring }
CrGtkConfiguration >> ensureAppearance: aName [
	| currentAppearance appearance |

	currentAppearance := #NSAppearance inObjC currentAppearance. 
	currentAppearance name UTF8String = aName ifTrue: [ ^ self ].

	appearance := #NSAppearance inObjC appearanceNamed: (#NSString inObjC stringWithUTF8String: aName).
	#NSApplication inObjC sharedApplication setAppearance: appearance
]

{ #category : #accessing }
CrGtkConfiguration >> iconProvider [

	^ iconProvider ifNil: [ 
		iconProvider := CrIconProvider new
			addLocation: self iconsDir;
			addLocation: self themeIconsDir;
			yourself ] 
]

{ #category : #'accessing resources' }
CrGtkConfiguration >> iconsDir [

	^ self model paths iconsDir
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
CrGtkConfiguration >> model [

	^ CrModelApplication current
]

{ #category : #'accessing resources' }
CrGtkConfiguration >> resourcesDir [

	^ self model paths resourcesDir
]

{ #category : #'accessing resources' }
CrGtkConfiguration >> themeIconsDir [

	^ self iconsDir / 'light'
]

{ #category : #accessing }
CrGtkConfiguration >> unixThemeName [

	^ 'Adwaita'
]

{ #category : #accessing }
CrGtkConfiguration >> windowsThemeName [

	^ 'Windows-10-master'
]
