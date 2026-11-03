# EQ Weapon Rack Sort Puzzle Solver README #

### What does it do? ###

```WeaponSortSolver.ps1``` is a Powershell script that solves the weapon rack sorting puzzle in the 2027 EQ (TBD) expansion mission and raid event (TBD)

### How do I get set up? ###

1. Download ```WeaponSortSolver.ps1``` into a convenient directory.  If you download from a browser, the .ps1 files may get a ```.txt``` extension attached to them.  Remove that extension so that it's named ```WeaponSortSolver.ps1``` by renaming the files.
1. Allow Windows to run unsigned powershell scripts:
  * Enable running Powershell scripts on Windows 10 by doing the following:  
    1. Click the Windows Start button
    1. Click the gear icon near the bottom
    1. The Settings dialog will come up. Click on "Update & Security" near the bottom.
    1. Inside of that dialog on the left, click "For developers".
    1. Now on the right hand side, scroll to the bottom area marked "PowerShell".
    1. Click the box to create a checkmark on "Change execution policy to allow local PowerShell scripts to run without signing. Require signing for remote scripts.".
    1. Underneath that, click the "Apply" button.
   
  * Enable running Powershell scripts on Windows 10 by doing the following: 
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
generates the right data in the table.


