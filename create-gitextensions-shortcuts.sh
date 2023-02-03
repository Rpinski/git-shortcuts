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

unconfig() {
    git config $GLOBALFLAG --unset "$@"
}

unconfig alias.ex
unconfig alias.exco
unconfig alias.exr
unconfig alias.exstash
unconfig alias.exconflicts

config alias.x "!gitex.cmd"
config alias.xco "x commit"
config alias.xr "x rebase --branch"
config alias.xstash "x stash"
config alias.xconflicts "x mergeconflicts"


echo "Finished."
