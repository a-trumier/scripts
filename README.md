# Custom Scripts

This is my repo for my stupid scripts that I use. Please feel free to use the
scripts for any purpose at all.

Licensed under MIT.

## install.sh

install.sh must be run as root. It will create copies of the scripts into a
directory of your choosing (default is /usr/bin) without the .sh so that it is
easier to use in the command line.

### Optional Arguments

1. Verbose (-v or --verbose): Prints extra information, i.e. what commands are
being run.

2. Clean (-c or --clean): Removes the copied files.

3. Place Directory (-p or --place-dir): The next argument will be the directory
that the scripts will be installed to. Default is /usr/bin.
