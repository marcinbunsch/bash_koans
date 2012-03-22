green "Piping"

test_piping_output_to_another_program() {
  # The pipe lets you use the output of a program as the input of another one
  local output=`echo 'milk' | sed -e "s/milk/beer/g"`

  assertEqual $output __
}