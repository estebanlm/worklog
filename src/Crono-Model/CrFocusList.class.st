"
I am a virtual list that will answer focused tasks.
"
Class {
	#name : #CrFocusList,
	#superclass : #CrVirtualList,
	#category : #'Crono-Model'
}

{ #category : #accessing }
CrFocusList >> name [

	^ self type name
]

{ #category : #accessing }
CrFocusList >> tasks [

	^ CrTodoTask selectMany: [ :each | each at: 'focused' ]
]

{ #category : #accessing }
CrFocusList >> type [

	^ CrTodoType focus
]
