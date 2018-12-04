#!/usr/bin/env bash

set -euo pipefail

if [[ -d $PWD/go-module-cache && ! -d $GOPATH/pkg/mod ]]; then
  mkdir -p $GOPATH/pkg
  ln -s $PWD/go-module-cache $GOPATH/pkg/mod
fi

go build -i -ldflags="-s -w" -o bin/detect github.com/cloudfoundry/libbuildpack/shims/cmd/detect
go build -i -ldflags="-s -w" -o bin/finalize github.com/cloudfoundry/libbuildpack/shims/cmd/finalize
go build -i -ldflags="-s -w" -o bin/release github.com/cloudfoundry/libbuildpack/shims/cmd/release
go build -i -ldflags="-s -w" -o bin/supply github.com/cloudfoundry/libbuildpack/shims/cmd/supply
