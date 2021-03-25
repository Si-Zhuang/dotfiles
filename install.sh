#!/bin/bash

# 1: Check OS type
echo "[Check] OS type... (1/7)"
if [ $(uname) != 'Darwin' ]; then
    echo "Your computer is not supported by this script..."
    exit 1
fi

echo "...OK"

# 2: Homebrew
echo "[Check] Homebrew... (2/7)"
if !(type "brew" > /dev/null 2>&1); then
    echo "[INSTALL]: Start installing homebrew (2/7)"
    #/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "...Done"
else
    echo "Homebrew has already been installed."
fi

echo "[Check Again] Homebrew... (2/7)"
if !(type "brew" > /dev/null 2>&1); then
    echo "... Homebrew is still not installed... Stop."
    exit 2
else
    echo "...OK"
fi
echo "...Done"

# 3: Neovim
if !(type "nvim" > /dev/null 2>&1); then
    echo "[INSTALL]: Start installing neovim (3/7)"
    #brew update
    #brew install neovim
    #mkdir -p $HOME/.config/nvim
    #if [ ! -e $HOME/.config/nvim/init.vim ]; then
    #    ln -sv $HOME/dotfiles/.vimrc $HOME/.config/nvim/init.vim
    #fi
    #nvim -c 'PlugInstall' -c 'qa!'
    echo "...Done"
else
    echo "Neovim has already been installed."
fi

echo "[Check Again] Neovim... (3/7)"
if !(type "nvim" > /dev/null 2>&1); then
    echo "... Neovim is still not installed... Stop."
    exit 3
else
    echo "...OK"
fi
echo "...Done"

# 4: fish shell (Currently, just install. I will udpate this part) TODO
if !(type "fish" > /dev/null 2>&1); then
    echo "[INSTALL]: Start installing fish shell (4/7)"
    #brew install fish
    echo "...Done"
else
    echo "fish shell has already been installed."
fi

echo "[Check Again] fishshell... (4/7)"
if !(type "fish" > /dev/null 2>&1); then
    echo "... fish shell is still not installed... Stop."
    exit 4
else
    echo "...OK"
fi
echo "...Done"

# 5: tmux
if !(type "tmux" > /dev/null 2>&1); then
    echo "[INSTALL]: Start installing tmux (5/7)"
    #brew install tmux
    #if [ ! -e $HOME/.tmux.conf ]; then
    #    ln -sv $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
    #fi
    echo "...Done"
else
    echo "tmux has already been installed."
fi

echo "[Check Again] tmux... (5/7)"
if !(type "tmux" > /dev/null 2>&1); then
    echo "... tmux is still not installed... Stop."
    exit 5
else
    echo "...OK"
fi
echo "...Done"

# 6: ag
if !(type "ag" > /dev/null 2>&1); then
    echo "[INSTALL]: Start installing ag (6/7)"
    #brew install ag
    echo "...Done"
else
    echo "ag has already been installed."
fi

echo "[Check Again] ag... (6/7)"
if !(type "ag" > /dev/null 2>&1); then
    echo "... ag is still not installed... Stop."
    exit 6
else
    echo "...OK"
fi
echo "...Done"

# 7: ctags
if !(type "ctags" > /dev/null 2>&1); then
    echo "[INSTALL]: Start installing ctags (7/7)"
    #brew install ctags
    echo "...Done"
else
    echo "ctags has already been installed."
fi

echo "[Check Again] fishshell... (7/7)"
if !(type "ctags" > /dev/null 2>&1); then
    echo "... ctags is still not installed... Stop."
    exit 7
else
    echo "...OK"
fi
echo "...Done"

# 7: Rust Update later: TODO

echo "FINISHED: Everything went well!!"
