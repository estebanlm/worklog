rendering
renderPost: aPost on: rss
	| link |
	link := self permaLinkFor: aPost.
	rss item: [
		rss title: aPost dateAsHuman.
		rss author: self user email.
		rss link: link.
		rss description: (aPost text truncateWithElipsisTo: self textMaxSize).
		rss publicationDate: (RRRfc822DateTime newDateAndTime: aPost date).
		rss guid: link ]