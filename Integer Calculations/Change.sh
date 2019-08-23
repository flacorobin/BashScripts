#!/usr/bin/env bash
#Correctly determine the fewest number of coins to be given to a customer such that the sum of the coins' value would equal the correct amount of change.

# For example
# An input of 15 with [1, 5, 10, 25, 100] should return one nickel (5) and one dime (10) or [5, 10]
# An input of 40 with [1, 5, 10, 25, 100] should return one nickel (5) and one dime (10) and one quarter (25) or [5, 10, 25]

amount=-1


while [[ $amount -le 0 ]]; do
echo -n "Script calculates change with the least number of coins. Enter amount [1 or higher]: "
read amount
done

current_amount=$amount

while [[ $current_amount/100 -ge 1 ]]; do
  let hs=$hs+1
  let current_amount=$current_amount-100
done

while [[ $current_amount/25 -ge 1 ]]; do
  let tfs=$tfs+1
  let current_amount=$current_amount-25
done

while [[ $current_amount/10 -ge 1 ]]; do
  let tns=$tns+1
  let current_amount=$current_amount-10
done

while [[ $current_amount/5 -ge 1 ]]; do
  let fvs=$fvs+1
  let current_amount=$current_amount-5
done

while [[ $current_amount/1 -ge 1 ]]; do
  let ons=$ons+1
  let current_amount=$current_amount-1
done

echo "100s: $hs"
echo "25s: $tfs"
echo "10s: $tns"
echo "5s: $fvs"
echo "1s: $ons"
