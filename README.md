Almura
===========

Clone
-----
If you are using Git, use this command to clone the project: `git clone git@github.com:AlmuraDev/Almura.git`

If you want to see the post-patch versions then visit the following repositories.
'https://github.com/AlmuraDev/Almura-API/'
'https://github.com/AlmuraDev/Almura-Server/'

Setup
-----
To setup Almura so you can start programming, Run the `applyPatches.sh` script provided with Almura from the base directory.

Compile
-------
To compile both API and Server just simply run the following command in the base directory: `mvn`

Create a Patch
--------------
To create a patch file all you need to do is commit changes to the API or Server folders, then run the `createPatches.sh` script from the base directory. Any commit that has a title that begins with `(Almura)` will be moved into the API-Patches folder or Server-Patches folder.

Modify a Patch
--------------
To modify an existing patch, you must create a new commit with your changes made then rebase it with the other commit that you want it merged into. 
