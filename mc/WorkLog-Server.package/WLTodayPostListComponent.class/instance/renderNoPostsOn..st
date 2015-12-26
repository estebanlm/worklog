rendering
renderNoPostsOn: html
	html div 
		class: 'no-posts';
		with: self fetchNoPostsMessage 
		