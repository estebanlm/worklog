rendering
renderLinkOn: html
	html span
		class: 'link';
		with: [ 
			html anchor 
				url: (self permaLink, '#disqus_thread');
				with: '0 Comments'.
			html text: ' - '.
			html anchor 
				url: self permaLink;
				with: 'Link']