# Your tests live in files named test_something.sh or something_test.sh.
# Every one of them runs, however deeply nested. A file named anything else
# is not a test file and will not run, so name new test files that way.
#
# Every .sh file is checked for syntax errors first, even one you have not
# sourced yet, so a file that will not parse cannot sit there unnoticed.
#
# Tests run from this directory whatever directory they live in, so every
# test file finds your code the same way, with source ./hiker.sh

export STICK_TO_CWD=true

for file in $(find . -name '*.sh'); do
  bash -n "${file}" || exit 1
done

bash_unit $(find . \( -name 'test_*.sh' -o -name '*_test.sh' \))
