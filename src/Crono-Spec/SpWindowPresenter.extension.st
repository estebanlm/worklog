Extension { #name : #SpWindowPresenter }

{ #category : #'*Crono-Spec' }
SpWindowPresenter >> bindKey: aCharacter toAction: aBlock [ 

	self 
		bindKeyCombination: aCharacter platformMeta
		toAction: aBlock
]

{ #category : #'*Crono-Spec' }
SpWindowPresenter >> bindKeysWith: aCommandGroup [

	contextKeyBindings ifNil: [ 
		contextKeyBindings := aCommandGroup asKMCategory.
		^ self ].
	
	aCommandGroup asKMCategory allEntries keymaps 
		do: [ :each | contextKeyBindings addKeymapEntry: each ]
]
