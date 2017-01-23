instance creation
from: fromDate to: toDate 
	^ self basicNew
		initializeFrom: fromDate to: toDate;
		yourself