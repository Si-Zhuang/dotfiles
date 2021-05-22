alias ls='ls -AG'
alias la='ls -AGl'
alias gip='curl http://gungnir-odin.appspot.com/util/clientinfo'

#export JAVA_HOME=$(/usr/libexec/java_home -v 14.0)
export PYTHONIOENCODING='utf-8'
export PATH=$PATH:$HOME/.nodebrew/current/bin
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function powerline_precmd() {
    PS1="$(~/go/bin/powerline-go -error $? -modules user,perms,cwd,git,exit,time -priority cwd,user,git-branch,git-status,perm,exit)"
}

function install_powerline_precmd() {
    for s in "${precmd_functions[@]}"; do
        if [ "$s" = "powerline_precmd" ]; then
            return
        fi
    done
    precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    install_powerline_precmd
fi
