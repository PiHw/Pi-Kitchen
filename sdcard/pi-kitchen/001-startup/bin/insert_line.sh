#!/bin/sh

display() {
  #Uncomment to display original file:
  #echo "BEFORE:"
  #cat "$FILE"
  echo "Command:"
  echo FILE=$FILE LINE=$LINE LOCATION=$LOCATION MODE=$MODE
}

usage() {
    echo "Usage:"
    echo " insert_line.sh FILE LINE [LOCATION] [MODE=[-A]fter/[-B]efore/[-R]eplace/[-D]elete]"
    echo "Example:"
    echo " insert_line.sh testfile.txt Donner Cupid -A"
    echo "       - will insert Donner after Cupid"
    echo "Example:"
    echo " insert_line.sh testfile.txt Donner -D"
    echo "       - will delete the line Donner"
    exit 1
}

insert_line_at_end() {
  display
  #Inserts the LINE at the end of the FILE
  #-F --fixed-strings Inperpret Pattern as fixed string
  #-x --line-regexp Select only matches for the whole line
  grep -q -Fx "$LINE" "$FILE" || echo $LINE >> "$FILE"
}

insert_line_after_location() {
  display
  #Insert the LINE after the LOCATION in the FILE
  grep -q -Fx "$LINE" "$FILE" || sed -i -e "/^$LOCATION$/a""$LINE" "$FILE"
}

insert_line_before_location() {
  display
  #Insert the LINE before the LOCATION in the FILE
  grep -q -Fx "$LINE" "$FILE" || sed -i -e "/^$LOCATION$/i""$LINE" "$FILE"
}

replace_line_at_location() {
  display
  sed -i -e 's/'"$LOCATION"'/'"$LINE"'/' "$FILE"
}

delete_line() {
  display
  sed -i -e '/'"$LINE"'/d' "$FILE"
}


if [ $# -eq 0 ] ; then
    #We need at least two args
    usage
elif [ $# -eq 1 ] ; then
    #We need at least two args
    usage
elif [ $# -eq 2 ] ; then
    FILE="$1" LINE="$2" LOCATION=null MODE=null
    insert_line_at_end
elif [ $# -eq 3 ] ; then
    if [ $3 = "-D" ] ; then
      FILE="$1" LINE="$2" LOCATION=null MODE="$3"
      delete_line
   else
      usage
   fi
elif [ $# -eq 4 ] ; then
    FILE="$1" LINE="$2" LOCATION="$3" MODE="$4"
    if [ $4 = "-A" ] ; then
      insert_line_after_location
    elif [ $4 = "-B" ] ; then
      insert_line_before_location
    elif [ $4 = "-R" ] ; then
      replace_line_at_location
    else
      usage
    fi
else
    FILE="$1" LINE="$2" LOCATION="$3" MODE=null
    insert_line_after_location
fi

#Uncomment to display changed file:
#echo "AFTER:"
#cat "$FILE"


