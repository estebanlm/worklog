Extension { #name : #String }

{ #category : #'*WorkLog-Server' }
String >> asDateDMY [
	^ Date fromStringDMY: self
]
