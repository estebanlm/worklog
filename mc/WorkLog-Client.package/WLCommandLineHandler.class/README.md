Worklog is the command line interface for register logs in the worklog (http://log.smallworks.eu).

Usage:

    worklog --help
    worklog --add --text="<text to log>"
    worklog --open
    worklog --review [--day|--week]
    worklog --create-config

	--help		
		Prints this help.
		
	--add
		Adds a log..
		
	--text="<text to log>"
		Specifies the text to log.
		
	--open-editor
		Opens a dialog to add a log.
		
	--review
		Prints a review of the worklog.
		
	--day
		--review will be printed for this day (this is the default).
		
	--week 
		--review will be printed for this week.

	--create-config
		--create a sample configuration file.
