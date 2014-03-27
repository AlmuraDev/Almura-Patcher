#!/bin/bash

basedir=`pwd`
set +v
echo "Rebuilding patch files from current fork state..."
function cleanupPatches {
    cd ${basedir}/${1}
    for patch in *.patch; do
        gitver=$(tail -n 2 $patch | grep -ve "^$" | tail -n 1)
        diffs=$(git diff --staged $patch | grep -E "^(\+|\-)" | grep -Ev "(From [a-z0-9]{32,}|\-\-\- a|\+\+\+ b|.index)")

        testver=$(echo "$diffs" | tail -n 2 | grep -ve "^$" | tail -n 1 | grep "$gitver")
        if [ "x$testver" != "x" ]; then
            diffs=$(echo "$diffs" | head -n -2)
        fi


        if [ "x$diffs" == "x" ] ; then
            git reset HEAD ${patch} >/dev/null
            git checkout -- ${patch} >/dev/null
        fi
    done
}

function savePatches {
    what=$1
    target=$2
    rm ${basedir}/${what}-Patches/*
    cd ${basedir}/${target}/
    git checkout master
    git format-patch --no-stat -N -o ${basedir}/${what}-Patches/ upstream/upstream
    cd ${basedir}
    echo "  Patches saved for $what to $what-Patches/"
}

function liberatePatches {
    source=$1
    destination=$2
    num=0
    rm ${basedir}/${destination}-Patches/*
    cd ${basedir}/${source}-Patches/
    
    for patch in *.patch; do
        if grep -q Almura ${patch}; then
            num=$((num+1))
            patchNum=$(printf "%04d" $num)
            newPatch=`echo $patch | sed "s/[0-9][0-9][0-9][0-9]-Almura/${patchNum}-Almura/g"`
            mv ${patch} ${basedir}/${destination}-Patches/${newPatch}
        fi
    done
    git add --ignore-removal ${basedir}/${source}-Patches
    git add --ignore-removal ${basedir}/${destination}-Patches
}

savePatches Bukkit API
savePatches CraftBukkit Server

liberatePatches Bukkit API
liberatePatches CraftBukkit Server

cleanupPatches Bukkit-Patches
cleanupPatches API-Patches
cleanupPatches CraftBukkit-Patches
cleanupPatches Server-Patches
