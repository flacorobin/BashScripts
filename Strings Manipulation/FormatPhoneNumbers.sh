#!/bin/bash
#Scripts that cleans up user-entered or file read phone numbers so that it is formatted by the North American Numbering Plan
#(NXX)-NXX-XXXX
#where N is any digit from 2 through 9 and X is any digit from 0 through 9. X is any digit from 0 through 9

#Looks for an argument that is a path to a file, if none is found or file does not exists ask for user input
if [ $# -ne 0 ]; then
   myFile=$1
   isFileSpecified=true
   doesFileExist=false
    if [ -f "$myFile" ]; then
      doesFileExist=true
    fi
fi

#Function to get confirmation
function confirm {
confirm_result=false
  read response
    case $response in
      [yY][eE][sS]|[yY])
        confirm_result=true
        ;;
      *)
        confirm_result=false
        ;;
    esac
}


echo "Script that cleans up user-entered or file read phone numbers so that it is formatted by the North American Numbering Plan."
echo -n "Enter phone number:"
read phone_number

phone_number=`echo $phone_number | tr -dc '0-9'`
echo "$phone_number"

if [[ ${#phone_number} -eq 11 || ${#phone_number} -eq 10 ]]; then
    let country_code=${phone_number:0:1}
    if [[ ${#phone_number} -eq 11 && $country_code -eq 1 ]]; then
      #extract the country code
      phone_number=${phone_number:1:10}
    else
      echo "Country code must be 1"
    fi
    let first_n=${phone_number:0:1}
    let second_n=${phone_number:3:1}
    if [[ first_n -ge 2 && first_n -le 9 ]]; then
      if [[ second_n -ge 2 && second_n -le 9 ]]; then
        output_number="+1 (${phone_number:0:3})-${phone_number:3:3}-${phone_number:6:4}"
        echo $output_number
      else
        echo "Wrong 4rd digit!"
      fi
    else
      echo "Wrong 1st digit!"
    fi
else
echo "Wrong number of digits on the phone number!"
fi
