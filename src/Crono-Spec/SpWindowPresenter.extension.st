Extension { #name : #SpWindowPresenter }

{ #category : #'*Crono-Spec' }
SpWindowPresenter >> bindKey: aCharacter toAction: aBlock [ 

	self 
		bindKeyCombination: (aCharacter command mac 
			| aCharacter control unix 
			| aCharacter control win)
		toAction: aBlock
]
