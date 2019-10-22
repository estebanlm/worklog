Class {
	#name : #CrApplicationStandaloneConfiguration,
	#superclass : #OSPlatformVisitor,
	#instVars : [
		'application',
		'mainWindow'
	],
	#category : #'Crono-Spec-Application'
}

{ #category : #accessing }
CrApplicationStandaloneConfiguration >> application [
	^ application
]

{ #category : #accessing }
CrApplicationStandaloneConfiguration >> application: anObject [
	application := anObject
]

{ #category : #accessing }
CrApplicationStandaloneConfiguration >> mainWindow [
	^ mainWindow
]

{ #category : #accessing }
CrApplicationStandaloneConfiguration >> mainWindow: anObject [
	mainWindow := anObject
]

{ #category : #visiting }
CrApplicationStandaloneConfiguration >> visitMacOS: platform [ 

"	mainWindow menu: self buildSystemMenu"
]
