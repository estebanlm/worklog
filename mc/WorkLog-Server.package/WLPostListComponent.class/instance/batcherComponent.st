accessing
batcherComponent
	^ batcherComponent ifNil: [ batcherComponent := self createBatcherComponent ]	