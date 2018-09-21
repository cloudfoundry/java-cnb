#!/usr/bin/env bash

set -euo pipefail
shopt -s globstar

extract() {
  echo "Extracting $1"
  mkdir -p $1
  tar xzf $1-artifactory/**/*.tgz -C $1
}

source $(dirname $0)/docker.sh
start_docker "" "" ""

extract build-system-buildpack
extract jvm-application-buildpack
extract openjdk-buildpack

chmod +x pack/pack-linux
pack/pack-linux create-builder cfje/java-buildpack-group --builder-config java-buildpack-group/builder.toml
