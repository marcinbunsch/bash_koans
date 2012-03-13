# About environment variables
green "Variables"

test_setting_the_variable() {
  variable=1
  assertEqual 1 $variable
}

test_using_double_quotes() {
  variable=2
  assertEqual "foo 2" "foo $variable"
}

test_unsetting_variables() {
  local newVariable="Foooo"
  unset newVariable
  assertEqual $newVariable ""
}

# description "Set the variable to the right value" "about_variables.sh:$LINENO"

# variable=1

# assertEqual 1 $variable

# description "Variables can be used in double quotes" "about_variables.sh:$LINENO"

# variable=1

# assertEqual "foo 1" "foo $variable"

# description "Variables can removed using unset" "about_variables.sh:$LINENO"

# newVariable="Foooo"
# unset newVariable

# assertEqual $newVariable __

