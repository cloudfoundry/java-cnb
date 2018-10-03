#!/usr/bin/env bash

set -euo pipefail
shopt -s globstar

extract() {
  echo "Extracting $1"
  mkdir -p $1
  tar xzf $1-artifactory/**/*.tgz -C $1
}

extract build-system-buildpack
extract jvm-application-buildpack
extract openjdk-buildpack

tar czvf "$PWD/artifactory/java-buildpack-group.tgz" -C . build-system-buildpack jvm-application-buildpack openjdk-buildpack -C java-buildpack-group builder.toml

tar tvf "$PWD/artifactory/java-buildpack-group.tgz"
