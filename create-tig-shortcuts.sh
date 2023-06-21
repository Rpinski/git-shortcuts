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
config tig.bind.main "* ?git cherry-pick %(commit)"
config tig.bind.main "+ ?git checkout -b %(prompt) %(commit)"
config tig.bind.main "U ?git pull --rebase"
config tig.bind.main "F !git fetch --all --tags --force -v"
config tig.bind.main "M ?git merge %(commit)"
config tig.bind.main "B ?git rebase %(commit)"
config tig.bind.main "I ?git rebase -i %(commit)"
config tig.bind.main "P ?git push"
config tig.bind.main "X ?git push -u"
config tig.bind.main "Z ?git push --force-with-lease"
config tig.bind.main "% ?git reset --hard %(commit)"
config tig.bind.refs "M ?git merge %(branch)"
config tig.bind.refs "B ?git rebase %(branch)"
config tig.bind.refs "I ?git rebase -i %(branch)"
config tig.bind.refs "F !git fetch --all --tags --force -v"
config tig.bind.refs "+ ?git checkout -b %(prompt) %(branch)"
config tig.bind.refs "% ?git reset --hard %(branch)"
config tig.bind.status "A !git commit --amend"
config tig.bind.status "U ?git pull --rebase"
config tig.bind.status "P ?git push"
config tig.bind.status "X ?git push -u"
config tig.bind.status "Z ?git push --force-with-lease"
config tig.bind.status "O !gh pr create -f -w"
config tig.bind.status "+ ?git checkout -b %(prompt)"
config tig.bind.status "F !git fetch --all --tags --force -v"
config tig.bind.status "Y ?git stash"

echo "Finished."
