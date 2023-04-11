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
config tig.bind.main "<Ctrl-h> ?git cherry-pick %(commit)"
config tig.bind.main "<Ctrl-n> ?git checkout -b %(prompt) %(commit)"
config tig.bind.main "P ?git pull --rebase"
config tig.bind.main "<Ctrl-t> !git fetch --all --tags --force -v"
config tig.bind.main "M ?git merge %(commit)"
config tig.bind.main "B ?git rebase %(commit)"
config tig.bind.main "<Ctrl-b> ?git rebase -i %(commit)"
config tig.bind.refs "M ?git merge %(branch)"
config tig.bind.main "B ?git rebase %(branch)"
config tig.bind.main "<Ctrl-b> ?git rebase -i %(branch)"
config tig.bind.status "A !git commit --amend"
config tig.bind.status "<Ctrl-p> ?git push"
config tig.bind.status "<Ctrl-n> ?git checkout -b %(prompt)"
config tig.bind.status "<Ctrl-t> !git fetch --all --tags --force -v"
config tig.bind.status "<Ctrl-u> ?git push -u"
config tig.bind.status "<Ctrl-o> ?gh pr create -f -w"

echo "Finished."
