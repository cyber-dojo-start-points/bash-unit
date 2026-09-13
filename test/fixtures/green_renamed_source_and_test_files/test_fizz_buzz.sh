#!/bin/bash

source ./fizz_buzz.sh

test_life_the_universe_and_everything()
{
  local expected=42
  local actual=$(fizz_buzz)
  assert_equals ${expected} ${actual}
}
