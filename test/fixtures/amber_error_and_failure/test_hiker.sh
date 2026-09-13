#!/bin/bash

source ./hiker.sh

test_life_the_universe_and_everything()
{
  local expected=42
  local actual=$(answer)
  assert_equals ${expected} ${actual}
}

test_the_checksum_of_the_answer()
{
  local actual=$(checksum)
  assert_equals 0 ${actual}
}
