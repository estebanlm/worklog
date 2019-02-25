"
I show this week posts.
"
Class {
	#name : #WLThisWeekPostListComponent,
	#superclass : #WLPostListComponent,
	#category : 'WorkLog-Server-View'
}

{ #category : #accessing }
WLThisWeekPostListComponent >> basicPostList [ 
	^ WLLog findWeek
]

{ #category : #accessing }
WLThisWeekPostListComponent >> listTitle [
	^ 'this week'
]
