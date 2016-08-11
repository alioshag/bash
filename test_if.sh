#!/bin/bash
#test_if.sh
DRIVER1="dynapro"
DRIVER2="savage"
echo "driver1 = \"$DRIVER1\"."

#test for dynapro driver
lspci | grep -i "$DRIVER1"

if [ $? -eq 0 ] 
then
  echo "XF dynapro."
  exit 0
fi  

#test for savage driver
lspci | grep -i "$DRIVER2"
if [ $? -eq 0 ]
then
  echo "XF savage"
  exit 0
fi  

exit 1
