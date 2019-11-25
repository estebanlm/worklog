Class {
	#name : #BaselineOfCrono,
	#superclass : #BaselineOf,
	#category : #BaselineOfCrono
}

{ #category : #baselines }
BaselineOfCrono >> baseline: spec [
	<baseline>
	
	spec for: #pharo do: [

		self marsGtk: spec.
		self objCBridge: spec.

		spec 
			package: 'WorkLog-Client';
			package: 'Crono-Model';
			package: 'Crono-View' ]
]

{ #category : #'external projects' }
BaselineOfCrono >> marsGtk: spec [

	spec
		baseline: 'Mars'
		with: [ spec repository: 'github://pharos-spec/mars' ]
]

{ #category : #'external projects' }
BaselineOfCrono >> objCBridge: spec [

	spec
		baseline: 'ObjCBridge'
		with: [ spec repository: 'github://estebanlm/objcbridge' ]
]
