"
I'm a component to show user profile.
Alternatively, I'm also show the menu.
"
Class {
	#name : #WLProfileComponent,
	#superclass : #WAComponent,
	#instVars : [
		'root'
	],
	#category : 'WorkLog-Server-View'
}

{ #category : #'instance creation' }
WLProfileComponent class >> root: aComponent [
	^ self new 
		root: aComponent;
		yourself
]

{ #category : #accessing }
WLProfileComponent >> fullName [
	^ self user fullName
]

{ #category : #accessing }
WLProfileComponent >> gravatarUrl [
	^ self user gravatarUrl, '?s=140'
]

{ #category : #rendering }
WLProfileComponent >> renderContentOn: html [
	html div
		class: 'image';
		with: [ 
			html tbsImage 
				beRounded;
				url: self gravatarUrl ].
	html div
		class: 'full-name';
		with: [
			html heading level: 3; with: self fullName ].
	html div 
		class: 'menu';
		with: [ 
			self renderMenuOn: html ]
]

{ #category : #rendering }
WLProfileComponent >> renderMenuOn: html [
	html heading level: 3; with: 'See'. 
	html tbsNav: [ 
		html tbsNavItem: [ 
			html anchor 
				callback: [ self root showToday ];
				with: 'Today' ].
		html tbsNavItem: [ 
			html anchor
				callback: [ self root showThisWeek ];
				with: 'This Week' ].
		html tbsNavItem: [ 
			html anchor
				callback: [ self root showThisMonth ];
				with: 'This Month' ]].
	

]

{ #category : #accessing }
WLProfileComponent >> root [
	^ root
]

{ #category : #accessing }
WLProfileComponent >> root: anObject [
	root := anObject
]

{ #category : #accessing }
WLProfileComponent >> user [
	^ WLServerConfiguration uniqueInstance user
]
