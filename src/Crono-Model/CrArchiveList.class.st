Class {
	#name : #CrArchiveList,
	#superclass : #CrVirtualList,
	#category : #'Crono-Model'
}

{ #category : #accessing }
CrArchiveList >> name [

	^ self type name
]

{ #category : #accessing }
CrArchiveList >> tasks [

	self flag: #TODO.
	^ #()
]

{ #category : #accessing }
CrArchiveList >> type [

	^ CrTodoType trash
]
