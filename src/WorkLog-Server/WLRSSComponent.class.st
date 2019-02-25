"
I publish the day log as an rss entry
"
Class {
	#name : #WLRSSComponent,
	#superclass : #RRComponent,
	#category : 'WorkLog-Server-View'
}

{ #category : #accessing }
WLRSSComponent class >> description [
	^ 'WorkLog RSS'
]

{ #category : #'class initialization' }
WLRSSComponent class >> initialize [
	(WAAdmin register: RRRssHandler at: 'rss')
		rootComponentClass: self
]

{ #category : #accessing }
WLRSSComponent >> config [
	^ WLServerConfiguration uniqueInstance
]

{ #category : #accessing }
WLRSSComponent >> permaLinkFor: aPost [
	^ String streamContents: [ :stream |
		stream 
			<< self config url 
			<< '/' << WLPostComponent path 
			<< '/' << aPost permaLink asString ]
]

{ #category : #accessing }
WLRSSComponent >> posts [
	^ WLLog findDay
]

{ #category : #rendering }
WLRSSComponent >> renderChannelOn: rss [
	rss title: self config title.
	rss link: self config url.
	rss description: self config title.
	rss language english.
	"rss publicationDate: 'Tue, 10 Jun 2003 04:00:00 GMT'.
	rss lastBuildDate: 'Tue, 10 Jun 2003 09:41:01 GMT'."
	rss defaultDocumentation.
	rss generator: 'WorkLog 1.0'.
	"rss managingEditor: 'editor@example.com'.
	rss webMaster: 'webmaster@example.com'"
]

{ #category : #rendering }
WLRSSComponent >> renderContentOn: rss [
	self renderChannelOn: rss.
	self posts do: [ :each | 
		self renderPost: each on: rss ]
]

{ #category : #rendering }
WLRSSComponent >> renderPost: aPost on: rss [
	| link |
	link := self permaLinkFor: aPost.
	rss item: [
		rss title: aPost dateAsHuman.
		rss author: self user email.
		rss link: link.
		rss description: (aPost text truncateWithElipsisTo: self textMaxSize).
		rss publicationDate: (RRRfc822DateTime newDateAndTime: aPost date).
		rss guid: link ]
]

{ #category : #accessing }
WLRSSComponent >> textMaxSize [
	^ 140 "Just to compete with twitter ;)"
]

{ #category : #accessing }
WLRSSComponent >> user [
	^ self config user
]
