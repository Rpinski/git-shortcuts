#!/usr/bin/env sh

GLOBALFLAG='--global'
if [ "$1" = "--local" ]; then
    echo "Configuring tig aliases in local repository..."
    GLOBALFLAG=''
else
    echo "Configuring global tig aliases..."
fi

config() {
    git config $GLOBALFLAG --add "$@"
}

unconfig() {
    git config $GLOBALFLAG --unset "$@"
}

config tig.bind.main "C ?git checkout %(commit)"
config tig.bind.main "P ?git cherry-pick %(commit)"
config tig.bind.main "B ?git checkout -b %(prompt) %(commit)"
config tig.bind.main "U ?git pull --rebase"
config tig.bind.main "<F9> @git fetch --all"
config tig.bind.main "M ?git merge %(commit)"
config tig.bind.refs "M ?git merge %(branch)"
config tig.bind.status "A !git commit --amend"
config tig.bind.status "P ?git push"
config tig.bind.status "G ?git submit"
config tig.bind.status "B ?git checkout -b %(prompt)"
config tig.bind.status "<F9> @git fetch --all"

echo "Finished."
