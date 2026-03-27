# ghq clone + cd
ghq-get() {
  ghq get "$1" && cd "$(ghq list -p -e "$1")"
}
