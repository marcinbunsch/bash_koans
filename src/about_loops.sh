green 'Loops'

test_for_loops() {
  local sum
  for iterator in $( seq 1 10 ); do
    (( sum++ ))
  done
  assertEqual $sum __
}

test_while_loops() {
  counter=0
  while [  $counter -lt 5 ]; do
    (( counter++ ))
  done

  assertEqual $counter __
}


test_until_loops() {
  counter=10
  while [  $counter -gt 7 ]; do
    (( counter-- ))
  done

  assertEqual $counter __
}