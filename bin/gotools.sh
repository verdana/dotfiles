#!/bin/bash

export http_proxy="192.168.1.116:1080"
export https_proxy="192.168.1.116:1080"

tools=(
    "github.com/acroca/go-symbols"
    "github.com/go-delve/delve/cmd/dlv"
    "github.com/golangci/golangci-lint/cmd/golangci-lint"
    "github.com/mdempsky/gocode"
    "github.com/ramya-rao-a/go-outline"
    "github.com/rogpeppe/godef"
    "github.com/sqs/goreturns"
    "github.com/stamblerre/gocode"
    "github.com/uudashr/gopkgs/cmd/gopkgs"
    "golang.org/x/tools/cmd/gorename"
    "golang.org/x/tools/cmd/guru"
)

for url in "${tools[@]}"; do
    go get -u -v $url
done

