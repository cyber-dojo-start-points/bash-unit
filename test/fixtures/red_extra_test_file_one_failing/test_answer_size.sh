#!/bin/bash

source ./hiker.sh

test_the_answer_is_three_digits_long()
{
  local actual=$(answer)
  assert_equals 3 ${#actual}
}
