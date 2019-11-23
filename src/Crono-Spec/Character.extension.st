Extension { #name : #Character }

{ #category : #'*Crono-Spec' }
Character >> platformMeta [

	^ self command mac | self control unix | self control win
]
