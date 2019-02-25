Worklog is the command line interface for register logs in the worklog (http://log.smallworks.eu).

Usage:

    worklog --help
    worklog --add [--text="<text to log>"|--file="<file to use as text>"]
    worklog --open
    worklog --review  --lapse=[day|week|month]
    worklog --create-config
    worklog --update-server
    worklog --update-status
    worklog --update-client
    worklog --remove --id="<log id>" 

	--help		
		Prints this help.
		
	--add
		Adds a log..
		
	--text="<text to log>"
		Specifies the text to log.
	
	--file="<file to use as text>"		
		Specifies a file with the log.	
		
	--open-editor
		Opens a dialog to add a log.
		
	--review
		Prints a review of the worklog.
		
	--lapse=[day|week|month]
		--review will be printed for this day (this is the default), this week or this month.

	--create-config
		Create a sample configuration file.

	--update-server
		Starts and update process on server (it will be updated with master branch on github).
		
	--update-server-status
		Prints update status from server

	--update-client
		Updates this client (it will be updated with master branch on github).
		
	--remove
		Remove one log identified with the permaLink number (needs to be used with --id). 
		
	 --id="<log id>" 
		Refers to permaLink of the log to be removed with --remove 
