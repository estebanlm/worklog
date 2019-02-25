"
I show this month posts.
"
Class {
	#name : #WLThisMonthPostListComponent,
	#superclass : #WLPostListComponent,
	#category : 'WorkLog-Server-View'
}

{ #category : #accessing }
WLThisMonthPostListComponent >> basicPostList [ 
	^ WLLog findMonth
]

{ #category : #accessing }
WLThisMonthPostListComponent >> listTitle [
	^ 'this month'
]
