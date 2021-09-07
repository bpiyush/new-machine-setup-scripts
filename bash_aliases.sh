# <----------- Basic aliases --------->
  alias c='clear'
  alias q='exit'
  alias home='cd ~'
  alias root='cd /'
  alias dtop='cd ~/Desktop'
  alias cd..='cd ../'
  alias ..='cd ../'
  alias ...='cd ../../'
  alias .3='cd ../../../'
  alias .4='cd ../../../../'
  alias .5='cd ../../../../../'
  alias .6='cd ../../../../../../'

# <---------- Text colors ------------>
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
ORANGE=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BLACK=$(tput setaf 8)
REMOVE_ALL=$(tput sgr0)

# <---------- Git helpers ------------>
alias gc='git checkout'
alias pull='git pull'
alias gs='git status'
alias gd='git diff'
alias glog="git log"
alias glogv="git log --graph --oneline --decorate"
alias gba='git branch -a'
alias git_visualize="git log --graph --oneline --decorate"
alias reset-local='git add .; git stash; pull'

# <------ Programs -------> #
alias loadbash='source ~/.bash_profile'
alias loadzsh='source ~/.oh-my-zsh'
alias remove_condabase='conda config --set auto_activate_base false'

# <------------ Utility functions ---------->
function rm_files () {
        find . -name $1 -exec rm -rf {} \;
}

function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
function parse_git_branch_raw {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function commit () {
        git commit -m "$1";
        echo $RED"=> Pushing to branch "$YELLOW$(parse_git_branch_raw)$REMOVE_ALL
        git push origin $(parse_git_branch_raw);
}

function new_branch () {
        if [ -z "$(git status --porcelain)" ]; then
                # Working directory clean
                echo "$CYAN => Clean working directory. Creating branch $YELLOW $1 $REMOVE_ALL"
                git checkout -b $1
                git push origin -u $1
        else
                # Uncommitted changes
                echo "$RED You have uncommitted changed. Please check! $REMOVE_ALL"
        fi
}

function rm_local_branch () {
        echo "$RED => Deleting local branch $YELLOW $1  $REMOVE_ALL"
        git branch -D $1
}

function rm_remote_branch () {
        echo "$RED => Deleting remote branch $YELLOW $1 $REMOVE_ALL"
        git push origin --delete $1
}

function rm_local_and_remote_branch () {
        rm_local_branch "$1"
        rm_remote_branch "$1"
}

function rename_branch () {
        oldname=$1
        newname=$2
        currbranch=$(parse_git_branch_raw)

        echo "$BLUE => Current working branch: $YELLOW $currbranch $REMOVE_ALL"
        echo "$BLUE => Renaming branch $YELLOW $oldname $REMOVE_ALL to $YELLOW $newname $REMOVE_ALL"

        if ["$oldname" == "$currbranch"]
        then
                git branch -m "$newname";
        else
                git branch -m "$oldname" "$newname"
        fi

        git push origin :"$oldname" "$newname";
        git push origin -u "$newname";
}
function archive () {
        git checkout $1
        git checkout dev-cleanup
        git tag archive/$1 $1
        rm_local_branch $1
        rm_remote_branch $1
}
