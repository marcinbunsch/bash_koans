# http://stackoverflow.com/questions/7650438/bash-funcname-value-expanding
# Required for the alias trick to work
shopt -s expand_aliases

COLOR_RED=$(
    tput setaf 1 # Red
    tput bold
    )
COLOR_GREEN=$(
    tput setaf 2 # Green
    tput bold
    )
COLOR_RESET=$(tput sgr0)

lesson_title() {
    echo "Thinking about $1"
}

green() {
  echo -e "${COLOR_GREEN}${1}${COLOR_RESET}"
}

red() {
  echo -e "${COLOR_RED}${1}${COLOR_RESET}"
}

output_stdout() {
  printf "out to stdout"
}

output_stderr() {
  printf "out to stdout"
  printf "out to stderr" 1>&2
}

output_both() {
  printf "out to stdout"
  printf "out to stderr" 1>&2
}

assertEqual() {
  if [[ "$3" != "$4" ]]; then
    local -i KOANS_DONE
    local -i LESSONS_DONE
    local filename=$(grep "$1" src/* -l)
    ((KOANS_DONE=KOANS_TOTAL - KOANS_LEFT))
    ((LESSONS_DONE=LESSONS_TOTAL - LESSONS_LEFT))
    echo "
  ${COLOR_RED}$1 has damaged your karma.${COLOR_RESET}

You have not yet reached enlightenment ...
  ${COLOR_RED}Expected $3, got $4${COLOR_RESET}

Please meditate on the following code:
  ${COLOR_RED}$filename:$2${COLOR_RESET}

You have completed ${KOANS_DONE} koans and ${LESSONS_DONE} lessons.
You are now ${KOANS_LEFT} koans and ${LESSONS_LEFT} lessons away from reaching enlightenment
"
# You are now ${KOANS_LEFT} of ${KOANS_TOTAL} koans and ${LESSONS_LEFT} of ${LESSONS_TOTAL} lessons away from reaching enlightenment

    exit 1
  fi
}
# This allows us to get the name of the functionw where this function was called
# http://stackoverflow.com/questions/7650438/bash-funcname-value-expanding
alias assertEqual='assertEqual ${FUNCNAME} ${LINENO}'
