baseline
baseline: spec
	<baseline>
	spec for: #pharo do: [
		spec 
			package: 'WorkLog-Client';
			package: 'WorkLog-Server'. 
			
		spec 
			group: 'default' with: #('client' 'server');
			group: 'client' with: #('WorkLog-Client');
			group: 'server' with: #('WorkLog-Server')].