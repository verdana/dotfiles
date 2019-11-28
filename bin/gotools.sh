#!/bin/bash

export GOPATH="$HOME/go"

tools=(
    "github.com/acroca/go-symbols"
    "github.com/go-delve/delve/cmd/dlv"
    "github.com/golangci/golangci-lint/cmd/golangci-lint"
    "github.com/mdempsky/gocode"
    "github.com/ramya-rao-a/go-outline"
    "github.com/rogpeppe/godef"
    "github.com/sqs/goreturns"
    "github.com/uudashr/gopkgs/cmd/gopkgs"
    "golang.org/x/tools/cmd/goimports"
    "golang.org/x/tools/cmd/gorename"
    "golang.org/x/tools/cmd/guru"
)

# Install gocode-gomod
go get -u -v "github.com/stamblerre/gocode"
mv $GOPATH/bin/gocode $GOPATH/bin/gocode-gomod

# Install other tools
for url in "${tools[@]}"; do
    go get -u -v $url
done

# gopls
env GO111MODULE=on go get golang.org/x/tools/gopls@latest

