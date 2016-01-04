rendering
renderFooterOn: html
	html div 
		class: 'footer';
		with: [
			html span: [ 
				html text: 'Want to stalk me? '.
				html anchor 
					url: '/rss';
					with: 'Suscribe to my rss!' ].
			html break.
			html span: 'Copyright (C) 2015-2016 by Esteban Lorenzano.']