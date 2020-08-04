#!/usr/bin/env sh

GLOBALFLAG='--global'
if [ "$1" = "--local" ]; then
    echo "Configuring git aliases for GitExtensions in local repository..."
    GLOBALFLAG=''
else
    echo "Configuring global git aliases for GitExtensions..."
fi

config() {
    git config $GLOBALFLAG "$@"
}

config alias.ex "!gitex.cmd"
config alias.exco "ex commit"
config alias.exr "ex rebase --branch"
config alias.exstash "ex stash"
config alias.exconflicts "ex mergeconflicts"


echo "Finished."
