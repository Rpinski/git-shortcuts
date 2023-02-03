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

config alias.lg "log --graph"
config alias.l "log --graph --pretty=format:'%C(auto)%<(15,trunc)%h%<(20,trunc)%an%<(18,trunc)%ai %d %s'"
config alias.ll "l --all"
config alias.a "add"
config alias.ai "add -i"
config alias.co "commit"
config alias.e "commit --amend"
config alias.ef "commit --amend -C HEAD"
config alias.b "branch"
config alias.bvv "branch -vv"
config alias.bb "branch -a"
config alias.bf "branch -f"
config alias.bcontains "branch -a -r --contains"
config alias.f "fetch"
config alias.ff "fetch --all"
config alias.u "pull -r"
config alias.p "push"
config alias.pu "push -u"
config alias.pf "push --force-with-lease"
config alias.s "status"
config alias.c "checkout"
config alias.cb "checkout -b"
config alias.cp "cherry-pick"
config alias.r "rebase"
config alias.ri "rebase -i"
config alias.rc "rebase --continue"
config alias.ra "rebase --abort"
config alias.rs "rebase --skip"
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
config alias.reh "reset --hard"

echo "Finished."
