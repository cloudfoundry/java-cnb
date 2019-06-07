#!/usr/bin/env bash

set -euo pipefail
shopt -s globstar

extract() {
  echo "Extracting ${1}"
  mkdir -p ${1}
  tar xzf ${1}-artifactory/**/*.tgz -C ${1}
}

extract azure-application-insights-cnb
extract build-system-cnb
extract debug-cnb
extract dist-zip-cnb
extract google-stackdriver-cnb
extract jdbc-cnb
extract jmx-cnb
extract jvm-application-cnb
extract openjdk-cnb
extract procfile-cnb
extract spring-auto-reconfiguration-cnb
extract spring-boot-cnb
extract tomcat-cnb

ID="org.cloudfoundry.java"
TARGET="${PWD}/artifactory/$(echo ${ID} | sed 's|\.|/|g')/${ID}/${VERSION}/${ID}-$(echo ${VERSION} | sed "s|SNAPSHOT|$(date '+%Y%m%d.%H%M%S')-1|").tgz"

mkdir -p $(dirname "${TARGET}")
tar czvf "${TARGET}" \
  azure-application-insights-cnb \
  build-system-cnb \
  debug-cnb \
  dist-zip-cnb \
  google-stackdriver-cnb \
  jdbc-cnb \
  jmx-cnb \
  jvm-application-cnb \
  openjdk-cnb \
  procfile-cnb \
  spring-auto-reconfiguration-cnb \
  spring-boot-cnb \
  tomcat-cnb \
  -C java-buildpack-group builder.toml
