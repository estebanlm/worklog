external projects
voyage: spec
	spec baseline: 'Voyage' with: [
		spec
			repository: 'github://pharo-nosql/voyage/mc';
			loads: #('mongo tests' 'memory tests') ]