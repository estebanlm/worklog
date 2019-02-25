Class {
	#name : #BaselineOfWorkLog,
	#superclass : #BaselineOf,
	#category : 'BaselineOfWorkLog'
}

{ #category : #baseline }
BaselineOfWorkLog >> baseline: spec [
	<baseline>
	spec for: #pharo do: [
		self seaside3: spec.
		self pillar: spec.
		self bootstrap: spec.
		self voyage: spec.
		
		spec 
			package: 'WorkLog-Client';
			package: 'WorkLog-Server' with: [ 
				spec requires: #('Voyage' 'Seaside3' 'Bootstrap' 'Pillar') ]. 
			
		spec 
			group: 'default' with: #('client' 'server');
			group: 'client' with: #('WorkLog-Client');
			group: 'server' with: #('WorkLog-Server')].
]

{ #category : #'external projects' }
BaselineOfWorkLog >> bootstrap: spec [
	spec project: 'Bootstrap' with: [
		spec
			className: 'ConfigurationOfBootstrap';
			versionString: #'stable';
			repository: 'http://smalltalkhub.com/mc/TorstenBergmann/Bootstrap/main' ].

]

{ #category : #'external projects' }
BaselineOfWorkLog >> pillar: spec [
	spec project: 'Pillar' with: [
		spec
			className: #ConfigurationOfPillar;
			versionString: #'stable';
			repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ]
]

{ #category : #'external projects' }
BaselineOfWorkLog >> seaside3: spec [
	spec project: 'Seaside3' with: [
		spec
			className: #ConfigurationOfSeaside3;
			versionString: #'stable';
			repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main/' ]
]

{ #category : #'external projects' }
BaselineOfWorkLog >> voyage: spec [
	spec baseline: 'Voyage' with: [
		spec
			repository: 'github://pharo-nosql/voyage/mc';
			loads: #('mongo tests' 'memory tests') ]
]
