green "Redirection"

test_redirecting_stdout_to_file() {

  echo "OMG" > tmp/redirect_test.txt

  local contents=`cat tmp/redirect_test.txt`

  assertEqual $contents "OMG"

}

test_redirecting_stderr_to_file() {
  grepdd 2> tmp/redirect_test.txt
}

test_redirecting_stdout_to_stderr() {
  # 1>&2
  $1
}

test_redirecting_stderr_to_stdout() {
  # grep 2>&1
  $1
}


test_redirecting_stdout_and_stderr_to_file() {
  # &>
  $1
}