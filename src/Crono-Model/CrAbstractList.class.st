Class {
	#name : #CrAbstractList,
	#superclass : #Object,
	#category : #'Crono-Model'
}

{ #category : #accessing }
CrAbstractList >> doneTasks [

	^ self tasks select: #isDone
]

{ #category : #accessing }
CrAbstractList >> doneTasksSize [

	^ self doneTasks size
]

{ #category : #accessing }
CrAbstractList >> iconName [

	^ self type defaultIconName
]

{ #category : #testing }
CrAbstractList >> includesTask: aTask [

	^ self tasks includes: aTask
]

{ #category : #testing }
CrAbstractList >> isEditable [

	^ self type isEditable
]

{ #category : #testing }
CrAbstractList >> isVisible [
	
	^ self type isVisible
]

{ #category : #accessing }
CrAbstractList >> name [

	^ self subclassResponsibility
]

{ #category : #accessing }
CrAbstractList >> pendingTasks [

	^ self tasks reject: #isDone
]

{ #category : #accessing }
CrAbstractList >> pendingTasksSize [

	^ self pendingTasks size
]

{ #category : #testing }
CrAbstractList >> showsCompletion [

	^ self type showsCompletion
]

{ #category : #testing }
CrAbstractList >> showsPendingSize [

	^ self type showsPendingSize
]

{ #category : #accessing }
CrAbstractList >> summaryString [
	| tasks tasksSize doneTasksSize pendingTasksSize |
	
	tasks := self tasks.
	
	tasksSize := tasks size.
	tasksSize = 0 ifTrue: [ ^ 'No tasks.' ].
	
	doneTasksSize := (tasks select: [ :each | each isDone ]) size.
	doneTasksSize = tasksSize ifTrue: [ ^ 'No pending tasks' ]. 
	
	pendingTasksSize := tasksSize - doneTasksSize.
	
	^ '{1} pending task{2}.' format: { 
		pendingTasksSize. 
		pendingTasksSize > 1 ifTrue: [ 's' ] ifFalse: [ '' ] }
]

{ #category : #accessing }
CrAbstractList >> tasks [

	^ self subclassResponsibility
]

{ #category : #accessing }
CrAbstractList >> tasksSize [

	^ self tasks size
]

{ #category : #accessing }
CrAbstractList >> type [

	^ self subclassResponsibility
]
