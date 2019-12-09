Class {
	#name : #CrTodoTypeUser,
	#superclass : #CrTodoType,
	#category : #'Crono-Model'
}

{ #category : #accessing }
CrTodoTypeUser >> defaultIconName [

	^ #user
]

{ #category : #accessing }
CrTodoTypeUser >> defaultName [

	^ 'New list'
]

{ #category : #accessing }
CrTodoTypeUser >> name [
	
	^ 'User'
]

{ #category : #accessing }
CrTodoTypeUser >> typeName [

	^ #user
]
