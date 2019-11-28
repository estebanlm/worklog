Class {
	#name : #BaselineOfCrono,
	#superclass : #BaselineOf,
	#category : #BaselineOfCrono
}

{ #category : #baselines }
BaselineOfCrono >> baseline: spec [
	<baseline>
	
	spec for: #pharo do: [

		self voyage: spec.
		self marsGtk: spec.
		self objCBridge: spec.

		spec 
			package: 'WorkLog-Client';
			package: 'Crono-Model' with: [ spec requires: #('Voyage') ];
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

{ #category : #'external projects' }
BaselineOfCrono >> voyage: spec [

	spec
		baseline: 'Voyage'
		with: [ 
			spec 
				loads: #('memory' 'unqlite');
				repository: 'github://pharo-nosql/voyage' ]
]
