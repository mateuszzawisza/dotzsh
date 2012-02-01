concise_logging_format='--pretty=format:%Cblue%h%Cred%d%Creset %cr %Cgreen%an%Creset %s'
#concise_logging_format='--pretty=format:%Crd%h%Creset %Creset %s %Cgreen%an %Creset %cr'

#alias glog='git log --graph --decorate=short --abbrev-commit --relative-date'
alias glog='git log --graph "$concise_logging_format"'
# Aliases
alias g='git'
#compdef g=git
alias gst='git status -sb'
alias st='gst'
#compdef _git gst=git-status
alias gl='git pull'
#compdef _git gl=git-pull
alias gup='git fetch && git rebase'
#compdef _git gup=git-fetch
alias gp='git push'
#compdef _git gp=git-push
gdv() { git-diff -w "$@" | view - }
#compdef _git gdv=git-diff
alias gc='git commit -v'
#compdef _git gc=git-commit
alias gca='git commit -v -a'
#compdef _git gca=git-commit
alias gco='git checkout'
#compdef _git gco=git-checkout
alias gb='git branch'
#compdef _git gb=git-branch
alias gba='git branch -a'
#compdef _git gba=git-branch
alias gcount='git shortlog -sn'
#compdef gcount=git
alias gcp='git cherry-pick'
#compdef _git gcp=git-cherry-pick
alias glg='git log --stat --max-count=5'
#compdef _git glg=git-log
alias glgg='git log --graph --max-count=5'
#compdef _git glgg=git-log
alias gss='git status -s'
#compdef _git gss=git-status
alias ga='git add -p'
#compdef _git ga=git-add
alias gm='git merge'
#compdef _git gm=git-merge

# Git and svn mix
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
#compdef git-svn-dcommit-push=git

alias gsr='git svn rebase'
alias gsd='git svn dcommit'
#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

# these aliases take advantage of the previous function
alias ggpull='git pull origin $(current_branch)'
#compdef ggpull=git
alias ggpush='git push origin $(current_branch)'
#compdef ggpush=git
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
#compdef ggpnp=git