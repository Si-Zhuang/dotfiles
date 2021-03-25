#keybindings
function fish_user_key_bindings
    bind \cr 'peco_select_history (commandline -b)' # peco
    bind \c] peco_select_ghq_repository # ghq
end

#set env
set JAVA_HOME (/usr/libexec/java_home -v 14.0)
set PYTHONIOENCODING 'utf-8'
# set CLICOLOR 1
set -xU LSCOLORS ""
set PYENV_ROOT "$HOME/.pyenv"
set -U GOPATH $HOME/go
set PATH /Users/yutakashoji/.pyenv/shims $GOPATH/bin /usr/local/bin $PYENV_ROOT/bin $HOME/.my_settings $HOME/Library/Android/sdk/platform-tools $HOME/.nodebrew/current/bin $HOME/.cargo/bin $PATH
set -U FZF_LEGACY_KEYBINDINGS 0

#powerline-shell
function fish_prompt
    $GOPATH/bin/powerline-go -error $status \
                            -modules user,perms,cwd,git,exit,time \
                            -priority cwd,user,git-branch,git-status,perms,exit \
                            -shell bare
#   powerline-shell --shell bare $status
end

#start setting
eval (pyenv init - | source)
source $HOME/.balias
