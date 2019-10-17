Class {
	#name : #WLConfiguration,
	#superclass : #Object,
	#category : #'WorkLog-Client-Model'
}

{ #category : #accessing }
WLConfiguration class >> fileName [

	^ self subclassResponsibility
]

{ #category : #'instance creation' }
WLConfiguration class >> readFromFileSystem [
	| reference |

	reference := self reference.
	reference exists ifFalse: [ ^ self new ].
	^ reference readStreamDo: [ :stream | 
		STON fromStream: stream  ]
]

{ #category : #accessing }
WLConfiguration class >> reference [

	^ FileLocator home / '.config' / 'worklog' / self fileName
]

{ #category : #writing }
WLConfiguration >> referenceExists: reference [
	
	self error: ('There is already a configuration file at {1}.' 
			format: { reference fullName })
]

{ #category : #writing }
WLConfiguration >> writeToFile [
	| reference |

	reference := self class reference.
	reference exists ifTrue: [ 
		self referenceExists: reference ]. 
	reference writeStreamDo: [ :stream | 
		STON put: self asJsonOnStreamPretty: stream ]
]
