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
			html span: [
				html text: ('Copyright (C) 2015-2016 by {1} - ' format: { WLServerConfiguration uniqueInstance user fullName }).
				html anchor
					target: '_new'; 
					url: 'http://github.com/estebanlm/worklog';
					with: 'Fork me on GitHub']]