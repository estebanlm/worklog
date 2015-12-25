specs
defaultSpec
	<spec>
	
	^ SpecLayout composed 
		newColumn: [ :column |
			column 
				newRow: #textArea;
				newRow: #acceptButton height: 35 ];
		yourself