Class {
	#name : #CrTodoTypeActive,
	#superclass : #CrTodoType,
	#category : #'Crono-Model'
}

{ #category : #accessing }
CrTodoTypeActive >> defaultIconName [

	^ #active
]

{ #category : #accessing }
CrTodoTypeActive >> name [
	
	^ 'Active'
]

{ #category : #testing }
CrTodoTypeActive >> showsCompletion [

	^ false
]

{ #category : #testing }
CrTodoTypeActive >> showsPendingSize [

	^ true
]

{ #category : #accessing }
CrTodoTypeActive >> typeName [

	^ #active
]
