"
I show posts from/to a date (D/M/Y)
"
Class {
	#name : #WLSearchPostListComponent,
	#superclass : #WLPostListComponent,
	#instVars : [
		'fromDate',
		'toDate'
	],
	#category : 'WorkLog-Server-View'
}

{ #category : #'instance creation' }
WLSearchPostListComponent class >> from: fromDate to: toDate [ 
	^ self basicNew
		initializeFrom: fromDate to: toDate;
		yourself
]

{ #category : #'instance creation' }
WLSearchPostListComponent class >> new [
	self error: 'Use #from:to:'
]

{ #category : #accessing }
WLSearchPostListComponent >> basicPostList [ 
	^ WLLog findFrom: self fromDate to: self toDate
]

{ #category : #accessing }
WLSearchPostListComponent >> fromDate [
	^ fromDate
]

{ #category : #initialization }
WLSearchPostListComponent >> initializeFrom: aDate to: otherDate [
	fromDate := aDate.
	toDate := otherDate.
	self initialize
]

{ #category : #accessing }
WLSearchPostListComponent >> listTitle [
	^ 'from {1} to {2}' format: { self fromDate. self toDate }
]

{ #category : #accessing }
WLSearchPostListComponent >> toDate [
	^ toDate
]
