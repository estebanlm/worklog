rendering
renderContentOn: html
	self renderHeaderOn: html.
	html tbsRow showGrid; with: [ 
		html tbsColumn 
			mediumSize: 2;
			mediumOffset: 2;
			with: profileComponent.
		html tbsColumn 
			mediumSize: 6;
			with: [ super renderContentOn: html ] ].

	