green "Return value"

test_return_value() {
  cd /ZOMGNODIRLIKETHIS &> /dev/null

  assertEqual $? __

  ls ~/ > /dev/null

  assertEqual $? __
}