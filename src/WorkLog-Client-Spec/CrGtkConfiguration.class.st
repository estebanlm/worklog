Class {
	#name : #CrGtkConfiguration,
	#superclass : #SpApplicationConfiguration,
	#category : #'WorkLog-Client-Spec'
}

{ #category : #private }
CrGtkConfiguration >> addProviderFromString: aString [

	(GtkCssProvider newFromString: aString) addForApplicationToDefaultScreen
]

{ #category : #configuring }
CrGtkConfiguration >> configureOSX: anApplication [

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

{ #category : #private }
CrGtkConfiguration >> installTheme: aString [

	GtkSettings default themeName: aString
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
