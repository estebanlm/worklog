rendering
renderContentOn: html
	self renderHeaderOn: html.
	html tbsContainerFluid: [
		html tbsRow "showGrid; "with: [ 
			html tbsColumn 
				mediumSize: 2;
				mediumOffset: 2;
				with: profileComponent.
			html tbsColumn 
				mediumSize: 6;
				with: [ super renderContentOn: html ] ].
		html tbsRow "showGrid; "with: [
			html tbsColumn 
				mediumSize: 8;
				mediumOffset: 2;
				with: [ self renderFooterOn: html ]] ].
		
	html html: ('<script id="dsq-count-scr" src="//{1}.disqus.com/count.js" async></script>' format: { WLServerConfiguration uniqueInstance disqusAccount })