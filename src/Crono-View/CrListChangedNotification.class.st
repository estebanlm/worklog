Class {
	#name : #CrListChangedNotification,
	#superclass : #CrListNotification,
	#category : #'Crono-View-Todo-Notifications'
}

{ #category : #testing }
CrListChangedNotification >> appliesToList: aTodoList [

	^ (super appliesToList: aTodoList)
		or: [ 
			self list isVirtual 
			and: [ self list listForAddTask = aTodoList ] ]
]

{ #category : #accessing }
CrListChangedNotification >> dispatchTo: anObject [ 

	anObject noteListChanged: self
]
