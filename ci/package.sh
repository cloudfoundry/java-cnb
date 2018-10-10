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

TARGET="$PWD/artifactory/org/cloudfoundry/openjdk/org.cloudfoundry.java/1.0.0-BUILD-SNAPSHOT/org.cloudfoundry.java-1.0.0-BUILD-$(date '+%Y%m%d.%H%M%S')-1.tgz"

mkdir -p $(dirname "$TARGET")
tar czvf "$TARGET" \
  build-system-buildpack \
  jvm-application-buildpack \
  openjdk-buildpack \
  -C java-buildpack-group builder.toml
