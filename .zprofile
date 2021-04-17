alias k=kubectl
alias python='python3'
alias d-c='docker-compose'
alias d-m='docker-machine'
alias gs="git switch"
alias top='sudo top'
alias purge='sudo purge'
alias ls=logo-ls
alias gitconflict='git diff --name-only --diff-filter=U | cat'
alias gmtv="echo 'Tidying code...' && goimports -w ./internal && gofmt -s -w ./internal && go mod vendor && go mod tidy && go mod verify"
alias gmt="echo 'Tidying code...' && go mod tidy && go mod verify"
alias gotest="echo 'Testing all code...' && go test -timeout 35s \$(go list ./... | grep -v /vendor/)"
alias gotestrace="echo 'Running tests with race flag...' && go test -race ./internal/..."
alias gotestinternal="echo 'Testing all code...' && go test -timeout 35s ./internal/..."
alias nofuckups='gmtv && gotestinternal'
alias brew-up='brew upgrade && brew update'

# FLYT
alias flytawsdevelopment="unset AWS_VAULT && aws-vault exec flypay-development && kubectl config use-context flyt-development"
alias flytawsstaging="unset AWS_VAULT && aws-vault exec flypay-staging && kubectl config use-context gen4-staging"
alias flytawsproduction="unset AWS_VAULT && aws-vault exec flypay-production && kubectl config use-context gen4-production"
alias flytcci='open https://app.circleci.com/pipelines/github/flypay/$(basename $(pwd))'

export AWS_SESSION_TTL=8h
export AWS_ASSUME_ROLE_TTL=1h

# eval "$(gh completion -s zsh)"

# DEV PATH
export DEV=$HOME/dev

# BREW
export BREW_DIR=/usr/local/opt

# GOLANG VARS
export GOPATH=/Users/blix/dev/golib
export PATH=$PATH:$(go env GOPATH)/bin
export GOROOT=/usr/local/opt/go/libexec
export GOPRIVATE=github.com/flypay/*
export GOPROXY=export GOPROXY=https://goproxy.io,direct
export GO111MODULE=auto
export AWS_SESSION_TTL=8h
export AWS_ASSUME_ROLE_TTL=1h

# GOLAND
export goland=/usr/local/bin/goland

# export NVM_DIR="$HOME/.nvm"
# [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"                                       # This loads n$
# [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads n$

# RUSTs


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
