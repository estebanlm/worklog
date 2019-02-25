"
I'm a web component who recognises bookmarks and delegates function to other components. 
I can have routes written in the same format as WARestfulFilter but because of the nature of this component, just  this pragmas has sense:

<get>
<path: '...'>

(is recommended that all my routes implement it)
"
Class {
	#name : #WLBookmarkComponent,
	#superclass : #WAComponent,
	#instVars : [
		'content',
		'routes'
	],
	#category : 'WorkLog-Server-View'
}

{ #category : #hooks }
WLBookmarkComponent >> children [ 
	^ { self content }
]

{ #category : #accessing }
WLBookmarkComponent >> content [
	^ content ifNil: [ content := self defaultContentComponent ]
]

{ #category : #accessing }
WLBookmarkComponent >> content: aComponent [
	content := aComponent
]

{ #category : #factory }
WLBookmarkComponent >> createRoutes [
	"Creates a collection of routes for the receiver. Override this method in subclasses to explicitely create the routes instead of using the default implementation that builds the routes using annotated methods (pragmas)."

	^ GRPlatform current createRoutesFrom: self class to: WLBookmarkComponent
]

{ #category : #accessing }
WLBookmarkComponent >> defaultContentComponent [
	^ WAComponent new
]

{ #category : #private }
WLBookmarkComponent >> executeResult: aRouteResult [	
	^ aRouteResult sendMessageTo: self
]

{ #category : #private }
WLBookmarkComponent >> handleFiltered: aRequestContext [
	| route |
	route := self routeForContext: aRequestContext ifAbsent: [ ^ self ].
	self content: (self executeResult: route).
	
]

{ #category : #rendering }
WLBookmarkComponent >> renderContentOn: html [
	self handleFiltered: self requestContext.
	html render: self content
]

{ #category : #private }
WLBookmarkComponent >> routeForContext: aRequestContext ifAbsent: aNiladicBlock [
	^ (WAByMethodRoutes routes: self routes)
		routeForContext: aRequestContext
		consume: true
		ifAbsent: aNiladicBlock
]

{ #category : #accessing }
WLBookmarkComponent >> routes [ 
	^ routes ifNil: [ routes := self createRoutes ]
]
