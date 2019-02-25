"
I'm a list of posts. 
I'm an abstract class, actually is my children who provides the correct list of posts to display.
"
Class {
	#name : #WLPostListComponent,
	#superclass : #WAComponent,
	#instVars : [
		'batcherComponent'
	],
	#category : 'WorkLog-Server-View'
}

{ #category : #accessing }
WLPostListComponent class >> batchSize [
	^ 15
]

{ #category : #accessing }
WLPostListComponent >> basicPostList [
	^ self subclassResponsibility
]

{ #category : #accessing }
WLPostListComponent >> batcherComponent [
	^ batcherComponent ifNil: [ batcherComponent := self createBatcherComponent ]	
]

{ #category : #hooks }
WLPostListComponent >> children [ 
	^ { self batcherComponent }
]

{ #category : #factory }
WLPostListComponent >> createBatcherComponent [
	^ WLBatchedList new 
		batchSize: self class batchSize; 
		items: self posts;
		yourself
]

{ #category : #accessing }
WLPostListComponent >> listTitle [
	^ self subclassResponsibility
]

{ #category : #accessing }
WLPostListComponent >> posts [ 
	^ self basicPostList
]

{ #category : #rendering }
WLPostListComponent >> renderContentOn: html [ 
	self renderHeaderOn: html.
	self renderPostsOn: html
]

{ #category : #rendering }
WLPostListComponent >> renderHeaderOn: html [
	html tbsPageHeader: [ 
		html heading 
			level1; 
			with: ('What I''ve been doing {1}?' format: { self listTitle }) ]
]

{ #category : #rendering }
WLPostListComponent >> renderPost: aPost on: html [
	html render: (WLPostComponent post: aPost)
]

{ #category : #rendering }
WLPostListComponent >> renderPostsOn: html [
	html tbsPanel: [ 
		self batcherComponent batch do: [ :each | 
			self renderPost: each on: html ]].
	html render: self batcherComponent.
	
]
