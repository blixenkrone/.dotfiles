alias k=kubectl
alias python='python3'
alias d-c='docker compose'
alias d-m='docker-machine'
alias gs="git switch"
alias top='sudo top'
alias purge='sudo purge'
alias ls=logo-ls
alias goimportfmt="echo 'Formatting imports...' && goimports -w ./internal"
alias gmtv="echo 'Tidying code...' && gofmt -s -w ./internal && go mod vendor && go mod tidy && go mod verify"
alias gmt="echo 'Tidying code...' && go mod tidy && go mod verify"
alias gotest="echo 'Testing all code...' && go test -timeout 35s \$(go list ./... | grep -v /vendor/)"
alias gotestrace="echo 'Running tests with race flag...' && go test -race ./internal/..."
alias gotestinternal="echo 'Testing all code...' && go test -timeout 35s ./internal/..."
alias brew-up='brew upgrade && brew update'
alias buf='/usr/local/bin/buf'

# FLYT
alias noflytfuckups='gmtv && gotestinternal'
alias flytawsdevelopment="unset AWS_VAULT && aws-vault exec flypay-development && kubectl config use-context flyt-development"
alias flytawsstaging="unset AWS_VAULT && aws-vault exec flypay-staging && kubectl config use-context gen4-staging"
alias flytawsproduction="unset AWS_VAULT && aws-vault exec flypay-production && kubectl config use-context gen4-production"
alias flytcci='open https://app.circleci.com/pipelines/github/flypay/$(basename $(pwd))'

# DEV PATH
export DEV=$HOME/dev
export DOTFILES=$HOME/.dotfiles

# BREW
export BREW_DIR=/usr/local/opt

# GOLANG VARS
export GOPATH=/Users/blix/dev/golib
export PATH=$PATH:$(go env GOPATH)/bin
export GOROOT=/usr/local/opt/go/libexec
export GOPRIVATE=github.com/flypay/*
export GOPROXY=export GOPROXY=https://goproxy.io,direct
export GO111MODULE=on

# AWS
# export AWS_SESSION_TTL=8h
# export AWS_ASSUME_ROLE_TTL=1h
export AWS_ACCESS_KEY_ID=AKIA36LKSWTPHSSF3TC3
export AWS_SECRET_ACCESS_KEY=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

# GOLAND
export goland=/usr/local/bin/goland

# RESTIC
RESTIC_REPOSITORY=s3:s3.amazonaws.com/mac-backup-restic

unsetopt correct_all
setopt correct

# RUST


gitall() {
    git add .
    if [ -n "$1" ]
    then
        git commit -m "$1"
    else
        git commit -m update
    fi
    git push
}

gitconflicts() {
    git merge $1 --no-ff --no-commit 
}

eval $(/opt/homebrew/bin/brew shellenv)
