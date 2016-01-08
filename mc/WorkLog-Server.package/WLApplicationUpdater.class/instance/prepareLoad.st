private
prepareLoad
	"Ensure I can load WorkLog-Server"
	(RPackageOrganizer default packageNamed: 'WorkLog-Server') 
		mcWorkingCopy 
		modified: false.	
