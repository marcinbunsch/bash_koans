green() {
  echo -e "\033[32m$1\033[0m"
}

red() {
  echo -e "\033[31m$1\033[0m"
}

assertEqual() {
  if [[ "$1" = "$2" ]]; then
    green "  $DESCRIPTION"
    return 1
  else
    echo ''
    red "$DESCRIPTION has damaged your karma."
    echo ''
    echo "You have not yet reached enlightenment ..."
    red  "  Expected $1, got $2"
    echo ''
    echo "Please meditate on the following code:"
    red  "  $LINE"
    echo ''
    echo "You are now 10/291 koans and 2/36 lessons away from reaching enlightenment"
    exit 1
  fi
}

DESCRIPTION=""
LINE=""
description() {
  DESCRIPTION="$1"
  LINE="$2"
}