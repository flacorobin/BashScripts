#!/usr/bin/env bash
#Looks for parameters, only one parameter accepted: path of file to analyze.
if [ $# -ne 0 ]; then
   myFile=$1
   doesFileExist=false
   isFileSpecified=true
    if [ -f "$myFile" ]; then
      doesFileExist=true
    fi
fi

#wordcount function
wordcount() {
  line_array=($line)
  len_line_array=${#line_array[@]}
  #words_array=()
  #counters_array=()
  len_words_array=${#words_array[@]}
  #index_words_array=0
  isEqual=false

  for (( i = 0; i < len_line_array; i++ )); do
  isEqual=false
    for (( j = 0; j < len_words_array; j++ )); do
      if [[ ${line_array[i]} == ${words_array[j]} ]]; then
        let counters_array[j]=${counters_array[j]}+1
        isEqual=true
      fi
    done

      if [[ $isEqual == false ]]; then
        words_array[index_words_array]=${line_array[i]}
        let counters_array[index_words_array]=${counters_array[index_words_array]}+1
        let index_words_array=index_words_array+1
        len_words_array=${#words_array[@]}
      fi
  done
}

#Script begins here
echo "Script that counts words on a string or file."

if [[ $isFileSpecified == true && $doesFileExist == true ]]; then
  echo "the filename is $myFile"

  for line in `cat $myFile`; do
    #echo "$line"
    wordcount
  done

else
  if [[ $doesFileExist == false ]]; then
    echo "File $myFile does not exist."
  fi
  echo -n "Enter string:"
  read line
  wordcount
fi

#echo ${words_array[@]}
#echo ${counters_array[@]}

#Stores the arrays on a temp file, applies sort, display results, removes temp file.
for (( i = 0; i < ${#words_array[@]}; i++ )); do
  echo "${words_array[i]} ${counters_array[i]}" >> temp.txt
done

/bin/sort -k 2 -n -r -t' ' temp.txt

rm -f temp.txt
