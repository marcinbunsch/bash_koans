lesson_title 'Loops'

test_for_loops() {
  local sum
  # _ is a (rather obscure) dummy variable (used for throwaway values)
  for _ in $( seq 1 10 ); do
    (( sum++ ))
  done
  assertEqual $sum __
}

test_while_loops() {
  counter=0
  while [ $counter -lt 5 ]; do
    (( counter++ ))
  done

  assertEqual $counter __
}


test_until_loops() {
  counter=10
  until [ $counter -lt 7 ]; do
    (( counter-- ))
  done

  assertEqual $counter __
}
