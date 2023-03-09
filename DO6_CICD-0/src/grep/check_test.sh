#!/bin/bash

$(bash test.sh > test_output.txt)
output=$(cat test_output.txt)
if [[ $output = "Files std_grep_result.txt and s21_grep_result.txt are identical" ]]; then
  echo "Tests completed without errors"
  else
  echo "WARNING: tests completed with errors"
  exit 1
fi
rm test_output.txt
