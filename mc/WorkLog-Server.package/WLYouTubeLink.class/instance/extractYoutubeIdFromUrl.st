private
extractYoutubeIdFromUrl
	^ (self url copyAfter: $?) copyAfter: $=