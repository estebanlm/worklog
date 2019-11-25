Class {
	#name : #CrIconProvider,
	#superclass : #Object,
	#instVars : [
		'icons',
		'location'
	],
	#category : #'Crono-View-Application'
}

{ #category : #'instance creation' }
CrIconProvider class >> new [

	self error: 'Use #newLocation:'
]

{ #category : #'instance creation' }
CrIconProvider class >> newLocation: aReference [ 

	^ self basicNew 
		initializeLocation: aReference;
		yourself
]

{ #category : #accessing }
CrIconProvider >> iconNamed: aSymbol [

	^ icons 
		at: aSymbol
		ifAbsentPut: [ self loadIconNamed: aSymbol ]
]

{ #category : #accessing }
CrIconProvider >> icons [

	^ icons
]

{ #category : #initialization }
CrIconProvider >> initialize [ 

	super initialize.
	icons := IdentityDictionary new
]

{ #category : #initialization }
CrIconProvider >> initializeLocation: aReference [

	location := aReference.
	self initialize
]

{ #category : #inspecting }
CrIconProvider >> inspectionIcons [
	<inspectorPresentationOrder: 0 title: 'Icons'> 

	^ SpListPresenter new
		items: (icons associations sorted: [ :a :b | a key < b key ]);
		icon: [ :each | each value ];
		display: [ :each | each key ];
		yourself
]

{ #category : #utils }
CrIconProvider >> loadAllIcons [

	(self location filesMatching: '*.png') do: [ :each |
		icons 
			at: each basename
			put: (self loadIcon: each) ]
]

{ #category : #utils }
CrIconProvider >> loadIcon: fileRef [

	fileRef exists ifFalse: [ 
		self error: ('Icon {1} does not exits' format: { fileRef fullName }) ].

	^ fileRef binaryReadStreamDo: [ :stream |
		 Form fromBinaryStream: stream ]
]

{ #category : #utils }
CrIconProvider >> loadIconNamed: aSymbol [

	^ self loadIcon: ((self location / aSymbol) withExtension: 'png')
]

{ #category : #accessing }
CrIconProvider >> location [

	^ location
]
