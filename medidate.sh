# Load all files in support
for file in `ls support`; do
  source support/$file
done

# Load all files in src
for file in `ls src`; do
  source src/$file
done

# OMG this is a bash test runner!! <3 <3 <3
# functions=`declare -F | cut -d ' ' -f 3 | grep ^test_`
# This style allows us to run tests in order
functions=`grep test_ src/* | cut -d '(' -f 1`
for i in $functions; do
  $i
done