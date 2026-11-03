# EQ Weapon Rack Sort Puzzle Solver README #

### What does it do? ###

```WeaponSortSolver.ps1``` is a Powershell script that solves the weapon rack sorting puzzle in the 2027 EQ (TBD) expansion mission and raid event (TBD)


### How do I get set up? ###

* Download ```WeaponSortSolver.ps1``` into a convenient directory.  If you download from a browser, the .ps1 files may get a ```.txt``` extension attached to them.  Remove that extension so that it's named ```WeaponSortSolver.ps1``` by renaming the files.

Enable running Powershell scripts by doing the following:

Windows 10:

1. Click the Windows Start button
1. Click the gear icon near the bottom
1. The Settings dialog will come up. Click on "Update & Security" near the bottom.
1. Inside of that dialog on the left, click "For developers".
1. Now on the right hand side, scroll to the bottom area marked "PowerShell".
1. Click the box to create a checkmark on "Change execution policy to allow local PowerShell scripts to run without signing. Require signing for remote scripts.".
1. Underneath that, click the "Apply" button.

Windows 11:

1. Click the Windows Start button
1. Click the Settings icon that looks like a gear
1. On the upper left where it says, "Find a setting", click into that box and type "powershell developer settings"
1. When you see the same-named option come up, click on that, and you should see "Privacy & Security > For developers" at the top
1. Near the bottom of the screen is a box called "PowerShell". Click on that to open it up
1. Some text will appear "Change execution policy to allow local PowerShell scripts to run without signing. Require signing for remote scripts."
1. Set the switch to the "On" position

_Important Note:_  Every time you download a new version of ```rollsplitter.ps1``` or ```rollsplitter_chooselog.ps1```, you need to:

1. Right click on the .ps1 file in File Explorer, and select "Properties"
1. At the bottom there will be a section that says,  "This file came from another computer and might be blocked to help protect this computer."  Right next to that is a checkbox that says, "Unblock".  Check that box and click OK.

Otherwise Windows will treat it as a foreign script, and give you permission errors.

* Open up a Powershell window by clicking the Windows Start button, then type ```PowerShell```.  "Windows PowerShell app" should be the top choice,  Click that.

* Once inside Powershell, ```cd``` to the directory containing rollsplitter.ps1, for example ```cd C:\Users\Jeff\Downloads```

* Invoke ```rollsplitter_chooselog.ps1``` 
```
.\rollsplitter_chooselog.ps1
```
(```rollsplitter_chooselog.ps1``` needs to be invoked when you choose a log file for the first time, or when you want to switch to monitor a different log file)

* Invoke ```rollsplitter.ps1```
```
.\rollsplitter.ps1
```

* You can try running some example ```/ran <num>``` commands, pretending you are rolling on loot with different max roll values.  Then run the script again and see that it generates the right data in the table.

* If everything works as expected, your default browser app (or spreadsheet app) will pop up with a table showing the rolls.

* Note that the script will ignore any ```/ran``` that use a range like ```/ran 100 200```.  The range must be 0 to _some number_, which is the default when you use the ```/ran``` command with a single number.  This should discourage any attempts to cheat by limiting the range.

* At this point, you can have people do their ```/ran``` commands based upon the numbers you gave them.

* Once they have finished, run ```rollsplitter.ps1``` on the command line again in Powershell.

### What if I can't get it to work? ###

If you have followed the directions above, and the script is still emitting errors, read the error message carefully.  Usually the cause will be in the first line of the error, and you can safely ignore the rest of the error message.  The most likely error is specifying an incorrect path to the log file.

If you still can't figure it out, send Wychwei or Turtylduv a message on Discord and we'll help you out.

### Is there an easier way to run it? ###

Funny you should ask!  Yes, there is:

1. Right click on the desktop, click New, then click Shortcut
1. Browse to the ```rollsplitter.ps1``` file and click Next
1. Change the name to something you like, for example ```rollsplitter```, then click Finish.
1. Find the resulting shortcut on your desktop, right click and select Properties. A dialog with tabs across the top will appear, with Shortcut selected.
1. In the Target box, add ```powershell.exe -ExecutionPolicy Bypass ``` in front of the path to ```rollsplitter.ps1```, then click OK.
1. You should see the icon on the desktop change to a powershell icon.  You can now double click this icon to run rollsplitter.ps1, or you can then right click and drag it to the taskbar to make it usable with a single click.
