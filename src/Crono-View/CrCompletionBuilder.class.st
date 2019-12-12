Class {
	#name : #CrCompletionBuilder,
	#superclass : #Object,
	#instVars : [
		'completion',
		'color'
	],
	#category : #'Crono-View-Todo-Extras'
}

{ #category : #initialization }
CrCompletionBuilder class >> defaultColor [
	
	^ Color gray
]

{ #category : #accessing }
CrCompletionBuilder >> borderWidth [

	^ 1
]

{ #category : #building }
CrCompletionBuilder >> build [
	| surface |
	
	surface := self buildSurface.
	^ surface asForm
]

{ #category : #building }
CrCompletionBuilder >> buildSurface [
	| surface size half center origin south angle isFull circle end arc |

	size := self formSize.
	half := size // 2.

	surface := AthensCairoSurface extent: size@size.

	center := half @ half.
	origin := center + (0 @ half negated) + (0 @ (self borderWidth)).
	south := center + (0 @ half) - (0 @ (self borderWidth)).
	angle := (360 * self completion) degreesToRadians.

	surface drawDuring: [ :canvas | 
		isFull := self completion = 1.
		isFull
			ifTrue: [ canvas setPaint: self color ]
			ifFalse: [ (canvas setStrokePaint: self color) width: self borderWidth ].

		circle := canvas createPath: [ :builder | 
          builder
	          absolute;
	          moveTo: origin;
	          "we need to paint it as two halfs"cwArcTo: south
	          angle: Float pi;
	          cwArcTo: origin angle: Float pi ].

		canvas drawShape: circle.
		isFull ifFalse: [ 
			end := origin rotateBy: angle negated about: center.
			canvas setPaint: self color.
			arc := canvas createPath: [ :builder | 
		       builder
			       absolute;
			       moveTo: end;
			       lineTo: center;
			       lineTo: origin;
			       cwArcTo: end angle: angle ].
			canvas drawShape: arc ] ].
	
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
