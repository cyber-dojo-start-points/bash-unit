#!/bin/bash

# Named neither test_*.sh nor *_test.sh, so it never runs, and half written
# so it does not parse either. Vanishing is what it must not do: every .sh
# file is parse-checked, so this one is seen even though it is not run.
source ./hiker.sh

test_the_answer_is_two_digits_long()
{
  local actual=$(answer
  assert_equals 2 ${#actual}
}
