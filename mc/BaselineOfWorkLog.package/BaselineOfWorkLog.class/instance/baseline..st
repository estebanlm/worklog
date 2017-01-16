baseline
baseline: spec
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