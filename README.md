

# QMK Firmware setup for Arch Linux.

 This is for Arch Linux and uses *yay* to install *qmk*.
 If you already have qmk installed then no worries. 
 
 You could also add a rule in the Makefile for your flavor of linux.

`make install` does the following steps:

 * Use yay to install qmk from the AUR, if needed.
 * Install the udev rules, restart udev 
 * Change the modem manager settings, and restart.
 * Use qmk setup to clone and configure your fork of qmk_firmware.

## Setting Up
 
### Edit the makefile: 

 * set your github id 
 * set the root of where you like to keep your projects.
 
## Installing.

  You will need to have sudo set up for your account.

  `make install`
  
  *Note:* _if you already have a project cloned `qmk setup` will not run_ 
  It will install everything else. But the `qmk setup` step will not
  since there is already a repo cloned into the spot you gave.

  Use `make force-qmk` to run qmk-setup in your existing project
  or just do it manually in your repo, with `qmk setup`.
  
