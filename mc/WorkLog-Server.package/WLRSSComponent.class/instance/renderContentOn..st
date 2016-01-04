rendering
renderContentOn: rss
	self renderChannelOn: rss.
	self posts do: [ :each | 
		self renderPost: each on: rss ]