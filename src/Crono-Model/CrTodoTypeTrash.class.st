Class {
	#name : #CrTodoTypeTrash,
	#superclass : #CrTodoType,
	#category : #'Crono-Model'
}

{ #category : #accessing }
CrTodoTypeTrash >> defaultIconName [

	^ #trash
]

{ #category : #testing }
CrTodoTypeTrash >> isVisible [

	^ false
]

{ #category : #accessing }
CrTodoTypeTrash >> name [
	
	^ 'Trash'
]

{ #category : #accessing }
CrTodoTypeTrash >> typeName [

	^ #trash
]