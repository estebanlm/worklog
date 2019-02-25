accessing
thumbnailUrl
	^ ('http://img.youtube.com/vi/{1}/default.jpg' format: { self extractYoutubeIdFromUrl })