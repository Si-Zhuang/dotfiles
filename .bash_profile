if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

eval "$(pyenv init -)"
# eval "echo bash_profile has been read"
#export GOPATH=$(go env GOPATH)
#export PATH=$PATH:$(go env GOPATH)/bin

export PATH="$HOME/.cargo/bin:$PATH"
