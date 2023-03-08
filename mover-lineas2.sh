#!/bin/bash

line_number=45
lines_to_move=5

for i in $(seq 1 $lines_to_move)
do
  sed -i "${line_number}i\ " Menu12.sh
done
