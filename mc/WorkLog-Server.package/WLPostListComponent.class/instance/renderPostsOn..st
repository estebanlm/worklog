rendering
renderPostsOn: html
	html tbsPanel: [ 
		self batcherComponent batch do: [ :each | 
			self renderPost: each on: html ]].
	html render: self batcherComponent.
	