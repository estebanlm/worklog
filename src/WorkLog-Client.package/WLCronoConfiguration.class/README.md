I keep the configuration for crono. 
I'm saved in a file "crono.ston" who should be placed at the side of the image who contains the application.
Since we are doing a stateless command line application, there is no problem on reading the configuration file each time we perform a task, because of this, the entry-point of this class is #readFromFileSystem (and not #new)

Take a look at #sample method to hints on config structure.