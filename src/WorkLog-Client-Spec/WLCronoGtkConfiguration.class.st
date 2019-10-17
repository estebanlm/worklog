Class {
	#name : #WLCronoGtkConfiguration,
	#superclass : #SpApplicationConfiguration,
	#category : #'WorkLog-Client-Spec'
}

{ #category : #private }
WLCronoGtkConfiguration >> addProviderFromString: aString [

	(GtkCssProvider newFromString: aString) addForApplicationToDefaultScreen
]

{ #category : #configuring }
WLCronoGtkConfiguration >> configureOSX: anApplication [

	self installTheme: self macThemeName.
	self addProviderFromString: '.cronoText { font: 12pt "Monaco" }'
]

{ #category : #configuring }
WLCronoGtkConfiguration >> configureUnix: anApplication [

	self unixThemeName 
		ifNotNil: [ :aName | self installTheme: aName ].
	self addProviderFromString: '.cronoText { font: 11pt "Monospace Regular" }'
]

{ #category : #configuring }
WLCronoGtkConfiguration >> configureWindows: anApplication [

	self installTheme: self windowsThemeName.
	self addProviderFromString: '.cronoText { font: 10pt "Microsoft Sans Serif" }'
]

{ #category : #private }
WLCronoGtkConfiguration >> installTheme: aString [

	GtkSettings default themeName: aString
]

{ #category : #accessing }
WLCronoGtkConfiguration >> macThemeName [
		
	^ 'Sierra-light'
]

{ #category : #accessing }
WLCronoGtkConfiguration >> unixThemeName [

	^ 'Adwaita'
]

{ #category : #accessing }
WLCronoGtkConfiguration >> windowsThemeName [

	^ 'Windows-10-master'
]
