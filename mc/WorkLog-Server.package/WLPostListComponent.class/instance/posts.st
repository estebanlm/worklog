accessing
posts 
	^ posts ifNil: [ posts := self basicPostList ]