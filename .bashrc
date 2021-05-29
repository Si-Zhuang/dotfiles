alias ls='ls -AG'
alias la='ls -AGl'
alias gip='curl http://gungnir-odin.appspot.com/util/clientinfo'
alias x86='arch -x86_64 bash'

#export JAVA_HOME=$(/usr/libexec/java_home -v 14.0)
export PYTHONIOENCODING='utf-8'
export PATH=$PATH:$HOME/.nodebrew/current/bin
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# PS1="[\u@ymac  \w \t]\$ "

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

function _update_ps1() {
    PS1="$(~/go/bin/powerline-go -error $? -modules user,perms,cwd,git,exit,time -priority cwd,user,git-branch,git-status,perm,exit)"
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
