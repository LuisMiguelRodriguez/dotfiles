#!/bin/bash
alias notes='vim ~/vimwiki/index.wiki '
alias Code='cd /media/luisthecoder/Code'
alias ll='ls -alF'
alias la='ls -Ar'
alias l='ls -CF'
alias i3config='vim ~/.config/i3/config'
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias tmux.conf='vim ~/.tmux.conf'
alias v='vim'
alias cmscript='cd /mnt/c/Users/mikes/scripts'
alias cmdownloads='cd /mnt/c/Users/mikes/scripts'
alias cmdocuments='cd /mnt/c/Users/mikes/scripts'
alias open='xdg-open .'
# enables gits auto completition
source ~/git-completion.bash

#set vi MOde in Bash
#set -o vi


HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors  ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# import custom functions
source ~/.my_custom_commands.sh

# get current branch in git repo
function parse_git_branch() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]
  then
    STAT=`parse_git_dirty`
    echo "[${BRANCH}${STAT}]"
  else
    echo ""
  fi
}

# get current status of git repo
function parse_git_dirty {
  status=`git status 2>&1 | tee`
  dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
  untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
  ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
  newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
  renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
  deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
  bits=''
  if [ "${renamed}" == "0" ]; then
    bits=">${bits}"
  fi
  if [ "${ahead}" == "0" ]; then
    bits="*${bits}"
  fi
  if [ "${newfile}" == "0" ]; then
    bits="+${bits}"
  fi
  if [ "${untracked}" == "0" ]; then
    bits="?${bits}"
  fi
  if [ "${deleted}" == "0" ]; then
    bits="x${bits}"
  fi
  if [ "${dirty}" == "0" ]; then
    bits="!${bits}"
  fi
  if [ ! "${bits}" == "" ]; then
    echo " ${bits}"
  else
    echo ""
  fi
}

export PS1="> \[\e[31m\]\u\[\e[m\] \[\e[37m\]@\[\e[m\] \[\e[33m\]\W\[\e[m\] \[\e[36m\]\`parse_git_branch\`\[\e[m\]: "


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /media/luisthecoder/Code/headbandshopify/node_modules/tabtab/.completions/serverless.bash ] && . /media/luisthecoder/Code/headbandshopify/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /media/luisthecoder/Code/headbandshopify/node_modules/tabtab/.completions/sls.bash ] && . /media/luisthecoder/Code/headbandshopify/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /media/luisthecoder/Code/headbandshopify/node_modules/tabtab/.completions/slss.bash ] && . /media/luisthecoder/Code/headbandshopify/node_modules/tabtab/.completions/slss.bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# update defualt python version to be used
alias python='/usr/bin/python3'
