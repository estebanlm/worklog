rendering
renderPost: aPost on: html
	html tbsPanel 
		class: 'post';
		with: [ 
			html div 
				class: 'text';
				with: [ html html: aPost textAsHTML ].
			html div 
				class: 'date';
				with: aPost dateAsHuman ]