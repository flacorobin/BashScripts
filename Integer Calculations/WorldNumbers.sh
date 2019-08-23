#!/bin/bash
#Given two integers, X and y , find their sum, difference, product, and quotient.
#Contrains -100 < X < 100 and -100 < Y < 100 and != 0
let x=-200
let y=-200

while [[ $x -lt -100 || $x -gt 100 ]]; do
  echo -n "Input X (Integer -100 to +100):"
  read x
done

while [[ $y -lt -100 || $y -gt 100 || $y -eq 0 ]]; do
  echo -n "Input Y(Integer -100 to +100, =!0):"
  read y
done

let sum=$x+$y
let diff=$x-$y
let prod=$x*$y
let quot=$x/$y
let mod=$x%$y

echo "Sum= $sum"
echo "Difference= $diff"
echo "Product= $prod"
echo "Quotient= $quot"
echo "Module= $mod"
