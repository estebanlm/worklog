Extension { #name : #SpWindowPresenter }

{ #category : #'*Crono-Spec' }
SpWindowPresenter >> bindKey: aCharacter toAction: aBlock [ 

	self 
		bindKeyCombination: aCharacter platformMeta
		toAction: aBlock
]

{ #category : #'*Crono-Spec' }
SpWindowPresenter >> bindKeysWith: aCommandGroup [

	aCommandGroup asKMCategory allEntries keymaps do: [ :each | 
		self 
			bindKeyCombination: each shortcut  
			toAction: each action ]
]
