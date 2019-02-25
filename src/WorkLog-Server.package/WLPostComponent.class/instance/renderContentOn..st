rendering
renderContentOn: html
	html tbsPanel 
		class: 'post';
		with: [ 
			html div 
				class: 'text';
				with: [ html html: self post textAsHTML ].
			html div 
				class: 'references';
				with: [ self renderReferencesOn: html ].
			html div
				class: 'date';
				with: [ 
					html span: self post dateAsHuman. 
					html space.
					self renderLinkOn: html ]]