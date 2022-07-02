#!/usr/bin/env bash

VERSION="4.5.0"
wget -q https://github.com/coder/code-server/releases/download/v${VERSION}/code-server-${VERSION}-linux-amd64.tar.gz
tar xf code-server-${VERSION}-linux-amd64.tar.gz
export PATH="${PATH}:/app/code-server-${VERSION}-linux-amd64/bin"
code-server --auth none --bind-addr 0.0.0.0:$PORT .
