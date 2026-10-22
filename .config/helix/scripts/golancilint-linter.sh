#!/usr/bin/env bash
set -euo pipefail

if [[ -x "./custom-gcl" ]]; then
    exec "./custom-gcl" "$@"
fi

exec "$(command -v golangci-lint)" "$@"
