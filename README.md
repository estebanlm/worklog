# WorkLog

This is a microblog app. Forget about twitter, facebook, g+... Forget about going social at all! 

**WorkLog** will allow you to keep a log of your work process, with some features I found very usefull: 

- You can add formatting using [pillar](http://www.smalltalkhub.com/#!/~Pier/Pillar) (Markdown support might come, but for the moment is not implemented)
- You do not have 140 characters max (probably you will not need much more, but anyway, the limitation is annoying :P)
- You can [disqus](http://disqus.com) posts.
- Posts are interpreted and links are detected and listed (so is easy to find them)
- Since is made for my own work, it 
- It has a command line!

## Server
It is a [Seaside](http://seaside.st) app, with a /web application a /api rest and a /rss client.
It uses [Voyage](https://github.com/estebanlm/voyage) and a [MongoDB](https://www.mongodb.com) as backend. 

## Client
Is implemented as a command line handler. 
You have severl bash scripts that wraps functionality, but basically you have: 

    Usage:
    
        worklog --help
        worklog --add [--text="<text to log>"|--file="<file to use as text>"]
        worklog --open-editor
        worklog --review  --lapse=[day|week|month]
        worklog --create-config
        worklog --update-server
        worklog --update-status
        worklog --update-client
    
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

## Future
No idea (about the future in general and this app in particular). But it might be cool to add: 

- Team support (how cool would be a team showing their progess all together)
- Markdown support
