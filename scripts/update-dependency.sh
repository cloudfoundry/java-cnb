uri() {
  echo $(cat ../dependency/url) | sed 's|gs://|https://storage.googleapis.com/|'
}

sha256() {
  shasum -a 256 ../dependency/*.tgz | cut -f 1 -d ' '
}
