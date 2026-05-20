#!/usr/bin/env bash
# git_aliases.sh — productivity git aliases

# Short commands
alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gp='git push'
alias gpl='git pull'
alias gst='git status -sb'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --oneline --graph --decorate -20'
alias gla='git log --oneline --graph --decorate --all'
alias gb='git branch -vv'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gm='git merge'
alias grb='git rebase'
alias grs='git restore'
alias grss='git restore --staged'
alias gsh='git stash'
alias gshp='git stash pop'

# Functions
gclean() { git branch --merged | grep -v '\*\|main\|master\|develop' | xargs git branch -d 2>/dev/null; echo "Cleaned merged branches."; }
gundo()  { git reset --soft HEAD~${1:-1}; echo "Undid ${1:-1} commit(s) (changes kept)."; }
gwip()   { git add -A && git commit -m "WIP: $(date '+%Y-%m-%d %H:%M')"; }
gfind()  { git log --all --grep="$1" --oneline; }
gsync()  { local b=$(git branch --show-current); git fetch origin && git rebase origin/$b; }

echo "✅ Git aliases loaded"
