# About environment variables

green "Variables"

test_setting_the_variable() {
  local variable=1
  assertEqual 1 $variable
}

test_using_double_quotes() {
  local variable=2
  assertEqual "foo 2" "foo $variable"
}

test_unsetting_variables() {
  local newVariable="Foooo"
  unset newVariable
  assertEqual $newVariable ""
}

# Variables defined in global namespace are available everywhere
THIS_VARIABLE_IS_GLOBAL=42
test_global_variables() {
  assertEqual $THIS_VARIABLE_IS_GLOBAL 42
}

# In this function we define a global variable
function_with_a_global_variable() {
  THIS_VARIABLE_IS_GLOBAL_FROM_A_FUNCTION=42
}
# Run the function
function_with_a_global_variable

test_global_variables_from_functions() {
  assertEqual $THIS_VARIABLE_IS_GLOBAL_FROM_A_FUNCTION 42
}

# In this function we define a local variable
function_with_a_local_variable() {
  local THIS_VARIABLE_IS_LOCAL=42
}
# Run the function
function_with_a_local_variable

test_local_variables() {
  assertEqual $THIS_VARIABLE_IS_LOCAL ''
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

