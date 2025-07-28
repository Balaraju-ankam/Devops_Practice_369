#!/bin/bash

echo "Enter first number:"
read a
echo "Enter second number:"
read b
echo "Choose operation (+ - * /):"
read op

case $op in
  +) res=$((a + b));;
    -) res=$((a - b));;
      \*) res=$((a * b));;
        /) 
	            if [ $b -eq 0 ]; then
	                  echo "Error: Division by zero!"
	                        exit 1
	                            else
	                                  res=$((a / b))
	                                      fi
	                                          ;;
                                            *) echo "Invalid operator"; exit 1;;
                                            esac

                                            echo "Result: $res"

