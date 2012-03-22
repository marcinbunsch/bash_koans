# http://stackoverflow.com/questions/7650438/bash-funcname-value-expanding
# Required for the alias trick to work
shopt -s expand_aliases

green() {
  echo -e "\033[32m$1\033[0m"
}

red() {
  echo -e "\033[31m$1\033[0m"
}

assertEqual() {
  if [[ "$3" != "$4" ]]; then
    echo ''
    red "  $1 has damaged your karma."
    echo ''
    echo "You have not yet reached enlightenment ..."
    red  "  Expected '$3', got '$4'"
    echo ''
    echo "Please meditate on the following code:"
    local filename=`grep  $1 src/* -l`
    red  "  $filename:$2"
    echo ''
    # echo "You are now 10/291 koans and 2/36 lessons away from reaching enlightenment"
    exit 1
  fi
}
# This allows us to get the name of the functionw where this function was called
# http://stackoverflow.com/questions/7650438/bash-funcname-value-expanding
alias assertEqual='assertEqual ${FUNCNAME} ${LINENO}'
