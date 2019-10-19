Extension { #name : #SpPresenter }

{ #category : #'*Crono-Spec' }
SpPresenter >> addGlobalShortcutsTo: aWindowPresenter [
	"fill with your shoutcuts"
]

{ #category : #'*Crono-Spec' }
SpPresenter >> firstResponder [
	"Override this to allow the presenter to re-define the one that will answer the 
	 'takeKeyboardFocus' call in composed presenters"

	^ self
]
