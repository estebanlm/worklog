factory
createBatcherComponent
	^ WLBatchedList new 
		batchSize: self class batchSize; 
		items: self posts;
		yourself