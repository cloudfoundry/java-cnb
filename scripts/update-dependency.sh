uri() {
  cat ../dependency/url
}

sha256() {
  shasum -a 256 ../dependency/*.tgz | cut -f 1 -d ' '
}
