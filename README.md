# EQ Weapon Rack Sort Puzzle Solver README #

### What does it do? ###

`WeaponSortSolver.ps1` is a Powershell script that solves the weapon rack sorting puzzle in the EQ **Favors of Fortune** expansion (Nov 2026) _Tier 3 – Plane of Guile Raid 2 – Eriak Zek_ event and also the _Plane of Guile - Eriak Zek Mission_.

### How do I get set up? ###

1. Download `WeaponSortSolver.ps1` into a convenient directory.  There are two ways to download it:
   1. Click on the green-colored **(Latest)** under Releases on the right side of the github page for this repo, then click on **Source code (zip)** to download it.  Whereever you've downloaded, go there using Windows file explorer and extract the files from the zip file.
   1. _- OR -_ click on the `WeaponSortSolver.ps1` in the github page, open the three-dot menu on the upper right, and click _Download_  .  Some browsers will attach a `.txt` suffix to the end of the name of the downloaded file, so you'll need to remove that suffix by renaming the file to `WeaponSortSolver.ps1`
1. Allow Windows to run unsigned powershell scripts:
    * Instructions for **Windows 10**:  
        1. Hold down the Windows Logo key and press the I key
        1. The Settings dialog will come up. Click on "Update & Security" near the bottom.
        1. Inside of that dialog on the left, click "For developers".
        1. Now on the right hand side, scroll to the bottom area marked "PowerShell".
        1. Click the box to create a checkmark on "Change execution policy to allow local PowerShell scripts to run without signing. Require signing for remote scripts.".
        1. Underneath that, click the "Apply" button.
   
    * Instructions for **Windows 11**: 
        1. Hold down the Windows Logo key and press the I key
        1. In the "Find a setting" box at the top, type "powershell"
        1. It will prompt with an option to jump to "Allow local PowerShell scripts to run without being signed". Click that.
        1. It will jump to a switch labeled "Change execution policy to allow local PowerShell scripts to run without signing. Require signing for remote scripts."
        1. Set the switch to the "On" position

   * _Important Note:_  Every time you download a new version of `WeaponSortSolver.ps1`, you need to:
      1. Right click on the `WeaponSortSolver.ps1` file in File Explorer, and select "Properties"
      1. At the bottom there will be a section that says,  "This file came from another computer and might be blocked to help protect this computer."  Right next to that is a checkbox that says, "Unblock".  Check that box and click OK.
1.  Create a shortcut on your desktop to run the script:
    1. On your Windows desktop, right click and select New -> Shortcut
    1. In the "Type the location of the item:" field, click the Browse button on the right, and navigate to where you put the downloaded `WeaponSortSolver.ps1` script, and select it.
    1. Edit the resulting path to your script, inserting the following at the very beginning:  
  ```C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoExit```  
  making sure to leave a space between the `-NoExit` and the path to `WeaponSortSolver.ps1`.  
  For example, the entire line might look like this:  
  ```C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoExit C:\Users\Malcom\Downloads\WeaponSortSolver.ps1```
    1. Click Next.
    1. Enter any name you'd like for this shortcut, e.g. WeaponSorter 
    1. Click Finish.  A new shortcut will appear on the desktop.

### How do I run it? ###

1. Double click on the shortcut you created in the last step of the instructions above.  If you've done the above steps correctly, a powershell window will pop up, and the script will prompt you for the contents of rack 1.
1. The script will prompt for each of the weapon rack contents.  Enter the contents of each weapon rack, using the abbreviated form, where s = sword, p = spear, and a = axe.  By default, enter the lowest-most weapon of each rack first.  So for example if you see a rack with the bottom-to-top contents spear, sword, spear, axe, enter `pspa`.  If a rack has nothing on it, just hit enter. The script does its best to detect errors you've made in entering the weapons.  Optionally you can enter the weapons from the top to the bottom by adding "-topFirst" after the path to the `WeaponSortSolver.ps1` in the shortcut you created earlier, e.g.:  
```C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoExit C:\Users\Malcom\Downloads\WeaponSortSolver.ps1 -topFirst```  
You can make this change by right-clicking on the shortcut, click Properties, then edit the Target field, and click OK.
1. After you fill out all four racks, the script will attempt to solve the puzzle.  
