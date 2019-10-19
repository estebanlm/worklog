Class {
	#name : #CrPresenter,
	#superclass : #SpPresenter,
	#category : #'Crono-Spec-View'
}

{ #category : #'instance creation' }
CrPresenter class >> new [

	^ self newApplication: CrApplication current
]

{ #category : #'instance creation' }
CrPresenter class >> open [
	<script>
	
	^ self new openWithSpec
]

{ #category : #'instance creation' }
CrPresenter class >> openDialog [
	<script>
	
	^ self new openDialogWithSpec
]

{ #category : #private }
CrPresenter >> configurationClass [
	
	^ nil
]

{ #category : #initialization }
CrPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter title: self title.
	self withConfigurationDo: [ :configuration |
		aWindowPresenter
			initialPosition: configuration bounds origin;
			initialExtent: configuration bounds extent;
			whenWillCloseDo: [ self storeSettings ] ].
	self traversePresentersDo: [ :each |
		each addGlobalShortcutsTo: aWindowPresenter ]
]

{ #category : #private }
CrPresenter >> storeSettings [

	self withConfigurationDo: [ :configuration |
		self storeSettingsInto: configuration.
		configuration 
			bounds: self window window bounds;
			writeToFile ]
]

{ #category : #private }
CrPresenter >> storeSettingsInto: aConfiguration [
]

{ #category : #initialization }
CrPresenter >> title [

	^ 'NONAME'
]

{ #category : #private }
CrPresenter >> withConfigurationDo: aBlock [

	self configurationClass ifNil: [ ^ self ].
	aBlock value: self configurationClass readFromFileSystem
]
