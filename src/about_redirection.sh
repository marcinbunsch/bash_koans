green "Redirection"

test_redirecting_stdout_to_file() {

  bin/output_stdout > tmp/redirect_test.txt

  local contents=`cat tmp/redirect_test.txt`

  assertEqual "$contents" __

}

test_redirecting_stderr_to_file() {
  bin/output_stderr 2> tmp/redirect_test2.txt

  local contents=`cat tmp/redirect_test2.txt`

  assertEqual "$contents" __
}

test_redirecting_stdout_to_stderr() {
  bin/output_stdout 2> tmp/redirect_test3.txt 1>&2

  local contents=`cat tmp/redirect_test3.txt`

  assertEqual "$contents" __

}

test_redirecting_stderr_to_stdout() {
  bin/output_stderr 1> tmp/redirect_test4.txt 2>&1

  local contents=`cat tmp/redirect_test4.txt`

  assertEqual "$contents" __

}

test_redirecting_stdout_and_stderr_to_file() {
  bin/output_both 1> tmp/redirect_test5.txt 2> tmp/redirect_test6.txt

  local contents5=`cat tmp/redirect_test5.txt`
  local contents6=`cat tmp/redirect_test6.txt`

  assertEqual "$contents5" __
  assertEqual "$contents6" __

}