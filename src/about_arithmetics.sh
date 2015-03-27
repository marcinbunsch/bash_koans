lesson_title "Arithmetic evaluation"

test_arithmetic_evaluation() {
  local output
  local output2

# shellcheck disable=SC2116
  output=$(echo 1+1)

  assertEqual "$output" __

  output2=$((1+1))

  assertEqual $output2 __

}
