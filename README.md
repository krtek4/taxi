Taxi syntax highlighting for Vim
================================

Developed by Gilles Meier <gilles.meier@liip.ch>

Installation
------------

### Option 1: Manual installation

1.  Move `taxi.vim` to your `.vim/syntax` directory. After downloading the 
    vim script or package:

        $ cd taxi/syntax
        $ mv taxi.vim ~/.vim/syntax/

### Option 2: Pathogen installation ***(recommended)***

1.  Download and install Tim Pope's [Pathogen].

2.  Next, move or clone the `taxi` directory so that it is 
    a subdirectory of the `.vim/bundle` directory.

    a. **Clone:** 

            $ cd ~/.vim/bundle
            $ git clone -b vim --single-branch git clone -b mybranch --single-branch git://github.com/sephii/taxi.git

    b. **Move:**

        In the directory containing the taxi vim scripts :
        
            $ mv taxi ~/.vim/bundle/

### Modify .vimrc

After either Option 1, put the following two lines in your .vimrc:

	syntax on
	filetype on
	au BufNewFile,BufRead	*.tks	set  filetype=taxi

License
-------

 DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
           Version 2, December 2004 

 Copyright (C) 2004 Sam Hocevar <sam@hocevar.net> 

 Everyone is permitted to copy and distribute verbatim or modified 
 copies of this license document, and changing it is allowed as long 
 as the name is changed. 

        DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION 

0. You just DO WHAT THE FUCK YOU WANT TO.
