#!/usr/bin/env sh

GLOBALFLAG='--global'
if [ "$1" = "--local" ]; then
    echo "Configuring git aliases in local repository..."
    GLOBALFLAG=''
else
    echo "Configuring global git aliases..."
fi

config() {
    git config $GLOBALFLAG "$@"
}

unconfig() {
    git config $GLOBALFLAG --unset "$@"
}

unconfig alias.ci
unconfig alias.cia
unconfig alias.bcontains
unconfig alias.bvv

config alias.lg "log --graph"
config alias.l "log --graph --pretty=format:'%C(auto)%<(15,trunc)%h%<(20,trunc)%an%<(18,trunc)%ai %d %s'"
config alias.ll "l --all"
config alias.lc '!git l $1 $2 `git merge-base $1 $2`^!'
config alias.lchead '!git lc HEAD $1'
config alias.lcmaster "lchead origin/master"
config alias.lcmain "lchead origin/main"
config alias.lp "l -p"
config alias.llp "ll -p"
config alias.a "add"
config alias.aa "add -a"
config alias.ai "add -i"
config alias.ap "add -p"
config alias.au "add -u"
config alias.co "commit"
config alias.e "commit --amend"
config alias.ef "commit --amend -C HEAD"
config alias.b "branch"
config alias.bv "branch -vv"
config alias.bb "branch -a"
config alias.bf "branch -f"
config alias.bc "branch -a -r --contains"
config alias.bd "branch -d"
config alias.bdd "branch -D"
config alias.bm "branch -m"
config alias.bgone "!git fetch -p && git for-each-ref --format '%(refname:short) %(upstream:track)' | awk '\$2 == \"[gone]\" {print \$1}' | xargs -r git branch -D"
config alias.fixmaster "branch -f master origin/master"
config alias.fixmain "branch -f main origin/main"
config alias.f "fetch --tags --force --prune"
config alias.ff "fetch --tags --force --all --prune"
config alias.u "pull -r"
config alias.p "push"
config alias.pu "push -u"
config alias.pt "push --tags"
config alias.pf "push --force-with-lease"
config alias.s "status"
config alias.c "checkout"
config alias.cmaster "!git checkout master && git pull --rebase"
config alias.cmain "!git checkout main && git pull --rebase"
config alias.cb "checkout -b"
config alias.cp "cherry-pick"
config alias.cbmaster "!git cmaster && git cb \$1"
config alias.cbmain "!git cmain && git cb \$1"
config alias.mmaster "!git fetch origin && git merge origin/master"
config alias.mmain "!git fetch origin && git merge origin/main"
config alias.r "rebase"
config alias.ri "rebase -i"
config alias.rc "rebase --continue"
config alias.ra "rebase --abort"
config alias.rs "rebase --skip"
config alias.rmaster "!git fetch origin && git rebase origin/master"
config alias.rmain "!git fetch origin && git rebase origin/main"
config alias.rimaster "!git fetch origin && git rebase -i origin/master"
config alias.rimain "!git fetch origin && git rebase -i origin/main"
config alias.y "stash"
config alias.yp "stash pop"
config alias.yl "stash list"
config alias.ya "stash apply"
config alias.yd "stash drop"
config alias.yu "stash push -u"
config alias.sm "submodule"
config alias.kk "!gitk --all &"
config alias.work "!git gui & gitk --all &"
config alias.g "!git gui &"
config alias.gi "citool"
config alias.ge "citool --amend"
config alias.mt "mergetool"
config alias.dt "difftool"
config alias.t "tag"
config alias.ta "tag -a"
config alias.tc "tag --contains"
config alias.re "reset"
config alias.reh "reset --hard"
config alias.x "restore"
config alias.xs "restore --staged"
config alias.rem "remote"

echo "Finished."
