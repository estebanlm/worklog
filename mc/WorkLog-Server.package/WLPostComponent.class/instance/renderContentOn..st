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
					html span: [ 
						html text: '('.
						html anchor 
							url: self permaLink;
							with: 'link'.
						html text: ')' ] ] ].