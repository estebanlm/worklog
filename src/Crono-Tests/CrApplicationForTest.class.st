Class {
	#name : #CrApplicationForTest,
	#superclass : #CrApplication,
	#category : #'Crono-Tests'
}

{ #category : #initialization }
CrApplicationForTest >> initializeBackend [

	GtkApplication ensureRunning.
	self useBackend: SpGtkConfiguration new
]

{ #category : #initialization }
CrApplicationForTest >> initializeRepository [

	repository := VOUnQLiteRepository onMemory.
	CrTodoList newBaseLists 
		do: [ :each | repository save: each ]
]
