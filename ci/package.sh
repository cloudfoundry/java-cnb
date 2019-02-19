#!/usr/bin/env bash

set -euo pipefail
shopt -s globstar

extract() {
  echo "Extracting ${1}"
  mkdir -p ${1}
  tar xzf ${1}-artifactory/**/*.tgz -C ${1}
}

extract azure-application-insights-buildpack
extract build-system-buildpack
extract debug-buildpack
extract google-stackdriver-buildpack
extract jmx-buildpack
extract jvm-application-buildpack
extract openjdk-buildpack
extract procfile-buildpack

ID="org.cloudfoundry.java"
TARGET="${PWD}/artifactory/$(echo ${ID} | sed 's|\.|/|g')/${ID}/${VERSION}/${ID}-$(echo ${VERSION} | sed "s|SNAPSHOT|$(date '+%Y%m%d.%H%M%S')-1|").tgz"

mkdir -p $(dirname "${TARGET}")
tar czvf "${TARGET}" \
  azure-application-insights-buildpack \
  build-system-buildpack \
  debug-buildpack \
  google-stackdriver-buildpack \
  jmx-buildpack \
  jvm-application-buildpack \
  openjdk-buildpack \
  procfile-buildpack \
  -C java-buildpack-group builder.toml
