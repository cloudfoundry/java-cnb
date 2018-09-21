#!/usr/bin/env bash

set -euo pipefail

tar xzvf build-system-buildpack-artifactory/*.tgz -C build-system-buildpack
tar xzvf jvm-application-buildpack-artifactory/*.tgz -C jvm-application-buildpack
tar xzvf openjdk-buildpack-artifactory/*.tgz -C openjdk-buildpack

pack/pack-linux create-builder cfje/java-buildpack-group --builder-config java-buildpack-group/builder.toml
