factory
createBatcherComponent
	^ TBSBatchedList new 
		batchSize: self class batchSize; 
		items: self posts;
		yourself