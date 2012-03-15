green "Return value"

test_return_value() {
  cd /ZOMGNODIRLIKETHIS &> /dev/null

  assertEqual $? 1

  ls ~/ > /dev/null

  assertEqual $? 0
}