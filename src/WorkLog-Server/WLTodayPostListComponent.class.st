"
I show today posts.
"
Class {
	#name : #WLTodayPostListComponent,
	#superclass : #WLPostListComponent,
	#category : 'WorkLog-Server-View'
}

{ #category : #accessing }
WLTodayPostListComponent class >> earlyInTheMorningMessage [
	^ 'Nothing yet. But do not despair, I''m dreaming with my next fixes.'
]

{ #category : #accessing }
WLTodayPostListComponent class >> nothingYetMessage [
	^ 'Nothing yet, I''m very sorry... but for sure I have a good reason!'
]

{ #category : #accessing }
WLTodayPostListComponent class >> weekendMessage [
	^ 'Nothing yet. And is weekend. But anything can happen, who knows? If I can manage the headache...'
]

{ #category : #accessing }
WLTodayPostListComponent >> basicPostList [ 
	^ WLLog findDay
]

{ #category : #private }
WLTodayPostListComponent >> fetchNoPostsMessage [
	| date time |
	
	date := Date today.
	time := Time now.
	
	time hour	 < 10
		ifTrue: [ ^ self class earlyInTheMorningMessage ].
	(#(1 7) includes: date dayOfWeek)
		ifTrue: [ ^ self class weekendMessage ].
	 
	^ self class nothingYetMessage

]

{ #category : #accessing }
WLTodayPostListComponent >> listTitle [
	^ 'today'
]

{ #category : #rendering }
WLTodayPostListComponent >> renderNoPostsOn: html [
	html div 
		class: 'no-posts';
		with: self fetchNoPostsMessage 
		
]

{ #category : #rendering }
WLTodayPostListComponent >> renderPostsOn: html [
	self posts ifEmpty: [ ^ self renderNoPostsOn: html ].
	^ super renderPostsOn: html 
]
