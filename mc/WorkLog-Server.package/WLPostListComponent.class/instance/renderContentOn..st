rendering
renderContentOn: html 
	html tbsRow with: [ 
		html tbsColumn 
			mediumSize: 6;
			mediumOffset: 3;
			with: [
			self renderHeaderOn: html.
			self posts do: [ :each | 
				self renderPost: each on: html ]]]