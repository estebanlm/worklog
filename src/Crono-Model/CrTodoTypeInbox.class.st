Class {
	#name : #CrTodoTypeInbox,
	#superclass : #CrTodoType,
	#category : #'Crono-Model'
}

{ #category : #default }
CrTodoTypeInbox >> defaultName [

	^ self name
]

{ #category : #accessing }
CrTodoTypeInbox >> name [
	
	^ 'Inbox'
]
