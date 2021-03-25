alias ls='ls -AG'
alias la='ls -AGl'
alias gip='curl http://gungnir-odin.appspot.com/util/clientinfo'

export JAVA_HOME=$(/usr/libexec/java_home -v 14.0)
export PYTHONIOENCODING='utf-8'
export PATH=$PATH:$HOME/.my_settings
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools

export PATH=$PATH:$HOME/.nodebrew/current/bin

# PS1="[\u@ymac  \w \t]\$ "

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

function _update_ps1() {
    PS1="$(~/go/bin/powerline-go -error $? -modules user,perms,cwd,git,exit,time -priority cwd,user,git-branch,git-status,perm,exit)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
