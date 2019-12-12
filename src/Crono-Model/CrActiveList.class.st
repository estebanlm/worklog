Class {
	#name : #CrActiveList,
	#superclass : #CrVirtualList,
	#category : #'Crono-Model'
}

{ #category : #accessing }
CrActiveList >> name [

	^ self type name
]

{ #category : #accessing }
CrActiveList >> tasks [

	^ CrTodoTask selectMany: [ :each | each at: 'focused' ]
]

{ #category : #accessing }
CrActiveList >> type [

	^ CrTodoType active
]
