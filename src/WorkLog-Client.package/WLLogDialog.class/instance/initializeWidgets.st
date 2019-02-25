initialization
initializeWidgets
	textArea := self newText.
	acceptButton := self newButton.
	
	acceptButton 
		label: 'Accept';
		action: [ self accept ].