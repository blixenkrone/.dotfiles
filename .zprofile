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
alias cat='bat'
alias ls='exa'
alias brewbundle='brew bundle dump --describe --force'
alias ncdu='gdu-go'

# DEV PATH
export EDITOR="hx"
export DEV=$HOME/dev
export DOTFILES=$HOME/dev/.dotfiles
export EDITOR="/Applications/Visual\ Studio\ Code.app/"
export SYNC=$HOME/Sync

# DOCKER
export PATH="$PATH:/opt/homebrew/bin/docker "

# BREW
# OBS the CPU arch determines the brew dir. For M1 chips it's /opt/homebrew
# export BREW_DIR=/usr/local/opt
export BREW_DIR=/opt/homebrew

# GOLANG VARS
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin
export GOROOT=$BREW_DIR/opt/go/libexec
# export GOPROXY=https://goproxy.io,direct
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

# LUNARVIM
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

gitconflicts() {
    git merge $1 --no-ff --no-commit
}

cover() {
    t="/tmp/go-cover.$$.tmp"
    go test -coverprofile=$t $@ && go tool cover -html=$t && unlink $t
}

hexfiend() {
  open -a "Hex Fiend" $1
}

. ~/.camprofile

eval $(/opt/homebrew/bin/brew shellenv)
