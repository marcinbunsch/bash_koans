# About environment variables

description "Set the variable to the right value" "about_variables.sh:7"

variable=__

assertEqual 1 $variable

description "Variables can be used in double quotes" "about_variables.sh:9"

variable=__

assertEqual "foo 1" "foo $variable"