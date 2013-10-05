AEMSpigot
===========

Team
----
[![Grinch](https://secure.gravatar.com/avatar/19d97d07c8797464aa8b7e2e0481da78?s=48)](https://bitbucket.org/NinjaGrinch "Grinch, Lead Developer")
[![hcherndon](http://www.spigotmc.org/data/avatars/s/0/591.jpg?1359776614)](https://bitbucket.org/hcherndon "hcherndon, Developer")

Clone
-----
If you are using Git, use this command to clone the project: `git clone git@bitbucket.org:AEMNetwork/aemspigot.git`

If you want to see the post-patch versions then visit the following repositories.
'https://bitbucket.org/AEMNetwork/aemspigot-api/'
'https://bitbucket.org/AEMNetwork/aemspigot-server/'

Setup
-----
To setup AEMSpigot so you can start programming, Run the `applyPatches.sh` script provided with AEMSpigot from the base directory.

Compile
-------
To compile both API and Server just simply run the following command in the base directory: `mvn`

Create a Patch
--------------
To create a patch file all you need to do is commit changes to the API or Server folders, then run the `createPatches.sh` script from the base directory. Any commit that has a title that begins with `(AEM)` will be moved into the API-Patches folder or Server-Patches folder.

Modify a Patch
--------------
To modify an existing patch, you must create a new commit with your changes made then rebase it with the other commit that you want it merged into. 
