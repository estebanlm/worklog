"
I'm a post note.
"
Class {
	#name : #WLPostComponent,
	#superclass : #WAComponent,
	#instVars : [
		'post'
	],
	#category : 'WorkLog-Server-View'
}

{ #category : #'instance creation' }
WLPostComponent class >> new [
	self error: 'Use #post:'
]

{ #category : #accessing }
WLPostComponent class >> path [
	^ 'post'
]

{ #category : #'instance creation' }
WLPostComponent class >> post: aPost [
	^ self basicNew
		initializePost: aPost;
		yourself
]

{ #category : #initialization }
WLPostComponent >> initializePost: aPost [
	post := aPost.
	self initialize
]

{ #category : #accessing }
WLPostComponent >> permaLink [
	^ String streamContents: [ :stream | 
		stream 
			<< '/' << WLApplicationComponent applicationPath
			<< '/' << self class path 
			<< '/' << self post permaLink  ]
]

{ #category : #accessing }
WLPostComponent >> post [
	^ post
]

{ #category : #accessing }
WLPostComponent >> references [
	^ self post referencedLinks
]

{ #category : #rendering }
WLPostComponent >> renderContentOn: html [
	html tbsPanel 
		class: 'post';
		with: [ 
			html div 
				class: 'text';
				with: [ html html: self post textAsHTML ].
			html div 
				class: 'references';
				with: [ self renderReferencesOn: html ].
			html div
				class: 'date';
				with: [ 
					html span: self post dateAsHuman. 
					html space.
					self renderLinkOn: html ]]
]

{ #category : #rendering }
WLPostComponent >> renderLinkOn: html [
	html span
		class: 'link';
		with: [ 
			html anchor 
				url: (self permaLink, '#disqus_thread');
				with: '0 Comments'.
			html text: ' - '.
			html anchor 
				url: self permaLink;
				with: 'Link']
]

{ #category : #rendering }
WLPostComponent >> renderReferencesOn: html [
	self references isEmptyOrNil ifTrue: [ ^ self ].
	
	"html heading level: 4; with: 'References'."
	self references do: [ :each | 
		html tbsThumbnail 
			class: 'reference';
			with: [ 
				html table: [ 
					html tableRow: [ 
						html tableData class: 'col-image'; with: [ 
							html anchor 
								url: each url;
								target: '_new';
								with: [ html image url: each thumbnailUrl ]].
						html tableData class: 'col-description'; with: [ 
							html heading level: 5; with: each title. 
							html anchor url: each url; target: '_new'; with: each url]]]]]
]

{ #category : #updating }
WLPostComponent >> updateUrl: aUrl [
	aUrl 
		addToPath: self class path;
		addToPath: self post permaLink asString.
	
]
