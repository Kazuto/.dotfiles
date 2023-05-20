info () {
  gum style --foreground "#38BDF8" " $1" "${@:2}"
}

success () {
  gum style --foreground "#A3E635" " $1" "${@:2}"
}

warning () {
  gum style --foreground "#FB923C" " $1" "${@:2}"
}
