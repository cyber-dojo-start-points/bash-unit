#!/bin/bash

# Named neither test_*.sh nor *_test.sh, so cyber-dojo.sh does not find it
# and these tests do not run. The assertion is one that would fail, so that
# a green says it really did not run rather than that it ran and passed.
source ./hiker.sh

test_the_answer_is_three_digits_long()
{
  local actual=$(answer)
  assert_equals 3 ${#actual}
}
