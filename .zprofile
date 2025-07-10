alias c='clear'
alias d-m='docker-machine'
alias d-c='docker-compose'
alias gs="git switch"
alias top='sudo top'
alias gmt="echo 'Tidying code...' && go mod tidy && go mod verify"
alias gotest="echo 'Testing all code...' && go test -timeout 35s \$(go list ./... | grep -v /vendor/)"
alias brew-up='brew upgrade && brew update'
alias buf='/opt/homebrew/bin/buf'
alias lzd='lazydocker'
alias cd='z'
alias cdi='zi'
alias cat='bat'
alias ls='eza -lah --icons'
alias brewbundle='brew bundle dump --describe --force'
alias ncdu='gdu-go'
alias zj='zellij -l welcome'
# alias zj='$HOME/.cargo/bin/zellij -l welcome'
alias zjc='zellij -l compact'
alias lg='lazygit'
alias lzd='lazydocker'
alias ping='gping'
alias sc='scooter'
alias tf='terraform'

# CONFIG
export CONFIG_PATH=$HOME/.config

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function zji() {
  # go test ./lox/scanner_test.go
  zellij run -i -- "$@"
}

# DEV PATH
export EDITOR="hx"
export DEV=$HOME/dev
export DOTFILES=$HOME/dev/.dotfiles
export SYNC=$HOME/Sync

# ZELLIJ

# DOCKER
export PATH="$PATH:/opt/homebrew/bin/docker"

# BREW
# OBS the CPU arch determines the brew dir. For M1 chips it's /opt/homebrew
export BREW_DIR=/opt/homebrew

# GOLANG VARS
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin
export GOROOT=$BREW_DIR/opt/go/libexec
export GOPROXY="https://proxy.golang.org,direct"
export GO111MODULE=on

# AWS
export AWS_SESSION_TTL=8h
export AWS_ASSUME_ROLE_TTL=1h

# GOLAND
export goland=$BREW_DIR/bin/goland

# RESTIC
export RESTIC_REPOSITORY=s3:s3.amazonaws.com/mac-backup-restic

# RUST
export PATH=$PATH:$HOME/.cargo/bin

# ZIG
export PATH=$PATH:$BREW_DIR/bin/zig

# RUBY
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# FZF
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
# Set up fzf key bindings and fuzzy completion
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:-1,fg+:#d0d0d0,bg:-1,bg+:#262626
  --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00
  --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf
  --color=border:#262626,label:#aeaeae,query:#d9d9d9'

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

export PATH=~/.local/bin/:$PATH

gitall() {
    git add .
    if [ -n "$1" ]; then
        git commit -m "$1"
    else
        git commit -m update
    fi
    git push
}

# Go test coverage
cover() { 
    t="/tmp/go-cover.$$.tmp"
    go test -coverprofile=$t $@ && go tool cover -html=$t && unlink $t
}

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# ZeroNorth
if test -f ~/.znprofile; then
  . ~/.znprofile
fi
