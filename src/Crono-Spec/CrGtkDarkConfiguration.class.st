Class {
	#name : #CrGtkDarkConfiguration,
	#superclass : #CrGtkConfiguration,
	#category : #'Crono-Spec-Application'
}

{ #category : #'accessing resources' }
CrGtkDarkConfiguration >> iconsDir [

	^ self resourcesDir / 'icons' / 'dark' / '16'
]

{ #category : #accessing }
CrGtkDarkConfiguration >> macAppearanceName [

	^ 'NSAppearanceNameDarkAqua'
]

{ #category : #accessing }
CrGtkDarkConfiguration >> macThemeName [
		
	^ 'Sierra-dark'
]

{ #category : #accessing }
CrGtkDarkConfiguration >> unixThemeName [

	^ 'Adwaita-dark'
]

{ #category : #accessing }
CrGtkDarkConfiguration >> windowsThemeName [

	^ 'Windows-10-Dark-master'
]
