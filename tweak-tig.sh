#!/usr/bin/env sh

GLOBALFLAG='--global'
if [ "$1" = "--local" ]; then
    echo "Tweaking tig settings in local repository..."
    GLOBALFLAG=''
else
    echo "Tweaking global tig settings..."
fi

config() {
    git config $GLOBALFLAG "$@"
}

unconfig() {
    git config $GLOBALFLAG --unset "$@"
}

config tig.line-graphics "utf-8"
config tig.diff-options "-m"
config tig.color.cursor "default default reverse"

echo "Finished."
