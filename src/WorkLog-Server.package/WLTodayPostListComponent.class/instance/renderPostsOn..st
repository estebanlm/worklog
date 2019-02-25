rendering
renderPostsOn: html
	self posts ifEmpty: [ ^ self renderNoPostsOn: html ].
	^ super renderPostsOn: html 