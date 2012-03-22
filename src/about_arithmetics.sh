green "Arithmetic evaluation"

test_arithmetic_evaluation() {

  local output=`echo 1+1`

  assertEqual $output __

  local output2=$((1+1))

  assertEqual $output2 __
}
