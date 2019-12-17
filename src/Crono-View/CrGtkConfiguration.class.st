"
I am a configuration for the Crono application to be used with Gtk backend. 
I define a light theme.
"
Class {
	#name : #CrGtkConfiguration,
	#superclass : #SpApplicationConfiguration,
	#instVars : [
		'iconProvider'
	],
	#category : #'Crono-View-Application'
}

{ #category : #private }
CrGtkConfiguration >> addProviderFromString: aString [

	(GtkCssProvider newFromString: aString) addForApplicationToDefaultScreen
]

{ #category : #configuring }
CrGtkConfiguration >> configure: anApplication [

	GtkRunLoop defer: [
		super configure: anApplication ]
]

{ #category : #configuring }
CrGtkConfiguration >> configureOSX: anApplication [

	self ensureAppearance: self macAppearanceName. 
	self installTheme: self macThemeName.
	self addProviderFromString: '
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
	self addProviderFromString: '
.cronoText { font: 11pt "Monospace Regular" }
.title { font-size: 14pt }
.titleShortcut { color: LightSlateGrey }
.list { padding: 5px }
.markFocus { margin-right: 3px }'
]

{ #category : #configuring }
CrGtkConfiguration >> configureWindows: anApplication [

	self installTheme: self windowsThemeName.
	self addProviderFromString: '
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

	^ self resourcesDir / 'icons' / '16'
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

{ #category : #'accessing resources' }
CrGtkConfiguration >> repositoryDir [
	"This is an util method to get the place where resources are located in development mode"
	^ (IceRepository registry detect: [ :each | each name = 'worklog' ]) location
]

{ #category : #'accessing resources' }
CrGtkConfiguration >> resourcesDir [

	^ CrApplication isDevelopment 
		ifTrue: [ self repositoryDir / 'resources' ]
		ifFalse: [ FileLocator imageDirectory / 'resources' ]
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
