Class {
	#name : #CrCompletionBuilder,
	#superclass : #Object,
	#instVars : [
		'surface',
		'fraction',
		'completion',
		'color'
	],
	#category : #'Crono-View-Todo-Extras'
}

{ #category : #initialization }
CrCompletionBuilder class >> defaultColor [
	
	^ Color gray
]

{ #category : #building }
CrCompletionBuilder >> build [
	| size half form angle center canvas vertices origin |

	size := self formSize.
	fraction := self completion.

	half := size // 2.
	form := Form extent: size@size depth: 32.
	angle := (360 * fraction) degreesToRadians.
	center := form boundingBox center.
	canvas := FormCanvas on: form.
	canvas 
		fillOval: form boundingBox 
		color: Color transparent 
		borderWidth: 2
		 borderColor: self color.
	vertices := OrderedCollection new.
	origin := (center + (0@(half negated))).
	vertices add: center.
	0 to: angle by: 1 degreesToRadians do: [ :anAngle |
    	vertices add: (origin rotateBy: anAngle negated about: center) ].

	^ canvas
		drawPolygon: vertices
		fillStyle: self color
]

{ #category : #'not used' }
CrCompletionBuilder >> buildSurface [
	| extent pieColor strokeColor |
	
	extent := 20@20.	
	surface := AthensCairoSurface extent: extent.
	surface drawDuring: [ :canvas | 
		| path |
		
		canvas pathTransform restoreAfter: [ 
			canvas setPaint: pieColor.
			(canvas setStrokePaint: strokeColor) width: 2.
			path := canvas createPath: [ :aPath |
				aPath
					moveTo: 0@(extent y/2);
					cwArcTo: 	(extent x/2)@0 angle: 180 degreesToRadians;
					cwArcTo: (extent x/2) negated @0 angle: 180 degreesToRadians ].
			canvas drawShape: path ] ].
	
	^ surface
]

{ #category : #accessing }
CrCompletionBuilder >> color [

	^ color ifNil: [ self class defaultColor ]
]

{ #category : #accessing }
CrCompletionBuilder >> color: aColor [

	color := aColor
]

{ #category : #accessing }
CrCompletionBuilder >> completion [

	^ completion
]

{ #category : #accessing }
CrCompletionBuilder >> completion: aPercentage [

	completion := aPercentage
]

{ #category : #accessing }
CrCompletionBuilder >> formSize [

	^ 16
]
