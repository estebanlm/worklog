Extension { #name : #KMKeyCombination }

{ #category : #'*Crono-Spec' }
KMKeyCombination >> platformMeta [

	^ (KMModifier command + self) mac 
		| (KMModifier control + self) unix 
		| (KMModifier control + self) win
]
