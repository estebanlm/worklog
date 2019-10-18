Class {
	#name : #CrApplicationConfiguration,
	#superclass : #WLConfiguration,
	#instVars : [
		'darkTheme'
	],
	#category : #'Crono-Spec-Config'
}

{ #category : #accessing }
CrApplicationConfiguration class >> fileName [

	^ 'app.ston'
]

{ #category : #accessing }
CrApplicationConfiguration >> darkTheme: aBoolean [

	darkTheme := aBoolean
]

{ #category : #initialization }
CrApplicationConfiguration >> initialize [

	super initialize.
	darkTheme := false
]

{ #category : #testing }
CrApplicationConfiguration >> isDarkTheme [

	^ darkTheme
]
