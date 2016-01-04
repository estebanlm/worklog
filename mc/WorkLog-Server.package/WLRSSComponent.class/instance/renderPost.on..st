rendering
renderPost: aPost on: rss
	rss item: [
		rss title: aPost dateAsHuman.
		rss author: self user email.
		rss link: self config url.
		rss description: (aPost text truncateWithElipsisTo: self textMaxSize).
		rss publicationDate: (RRRfc822DateTime newDateAndTime: aPost date).
		rss guid: (self permaLinkFor: aPost) ]