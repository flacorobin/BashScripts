#!/bin/bash
#Given three integers (X, Y, and Z) representing the three sides of a triangle, identify whether the triangle is Scalene, Isosceles, or Equilateral.
#Contrains 1<= X, Y, Z <= 1000

let x=-1
let y=-1
let z-1
equilateral=false

while [[ $x -lt 1 || $x -gt 1000 ]]; do
echo -n "Input X (Integer 1 to 1000)"
read x
done

while [[ $y -lt 1 || $y -gt 1000 ]]; do
echo -n "Input Y (Integer 1 to 1000)"
read y
done

while [[ $z -lt 1 || $z -gt 1000 ]]; do
echo -n "Input Z (Integer 1 to 1000)"
read z
done

if [[ $x -eq $y && $x -eq $z ]]; then
  echo "EQUILATERAL"
  equilateral=true
fi

if [[ $equilateral == false ]]; then
  if [[ $x -eq $y || $x -eq $z || $z -eq $y ]]; then
   echo "ISOSCELES"
  else
    echo "SCALENE"
  fi
fi
