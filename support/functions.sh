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
  printf "out to stderr" 1>&2
}

output_both() {
  printf "out to stdout"
  printf "out to stderr" 1>&2
}

assertEqual() {
  # Parameters
  local EXPECTED_VALUE="$1"
  local REAL_VALUE="$2"
  # Context
  local ASSERT_FUNCTION="${FUNCNAME[1]}"
  local ASSERT_SOURCE_FILE="${BASH_SOURCE[1]}"
  local ASSERT_SOURCE_LINE="${BASH_LINENO[0]}"

  if [[ "${EXPECTED_VALUE}" != "${REAL_VALUE}" ]]; then
    
    local -i KOANS_DONE
    local -i LESSONS_DONE
    ((KOANS_DONE=KOANS_TOTAL - KOANS_LEFT))
    ((LESSONS_DONE=LESSONS_TOTAL - LESSONS_LEFT))
    if [ "$TEST_ALL" != "YES" ] ; then
      echo "
  ${COLOR_RED}${ASSERT_FUNCTION} has damaged your karma.${COLOR_RESET}

You have not yet reached enlightenment ...
  ${COLOR_RED}Expected ${EXPECTED_VALUE}, got ${REAL_VALUE}${COLOR_RESET}

Please meditate on the following code:
  ${COLOR_RED}${ASSERT_SOURCE_FILE}:${ASSERT_SOURCE_LINE}${COLOR_RESET}

You have completed ${KOANS_DONE} koans and ${LESSONS_DONE} lessons.
You are now ${KOANS_LEFT} koans and ${LESSONS_LEFT} lessons away from reaching enlightenment
"
# You are now ${KOANS_LEFT} of ${KOANS_TOTAL} koans and ${LESSONS_LEFT} of ${LESSONS_TOTAL} lessons away from reaching enlightenment
      exit 1
    else
      echo "  ${COLOR_RED}${ASSERT_FUNCTION} has damaged your karma.${COLOR_RESET}"
    fi
  else
    echo "  ${COLOR_GREEN}${ASSERT_FUNCTION} has expanded your awareness.${COLOR_RESET}"
  fi
}
