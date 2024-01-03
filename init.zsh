defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 40 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 150       # normal minimum is 2 (30 ms)

echo "Added defaults"

## Install homebrew
if ! type "brew" >/dev/null; then
    echo "installing brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "brew already installed"
fi

## Install oh my zsh
if [[ $ZSH == "" ]]; then
    echo "installing omz"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo "omz already installed"
fi
