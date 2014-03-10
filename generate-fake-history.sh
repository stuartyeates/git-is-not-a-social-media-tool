#!/bin/bash
#a script to re-create a file, one line at a time, one day per line
cp LICENSE-old LICENSE

if [ ! -e "$1" ] 
then
    echo $0 accepts a single parameter, the filename to fake.
    exit
fi

 
FILE="$1"
TMP_FILE="/tmp/$$-`basename "$FILE"`"
mv $FILE $TMP_FILE
LINES=`wc -l < $TMP_FILE`
echo $LINES

COUNTER=0
while [  $COUNTER -lt $LINES ]; do
    i=$COUNTER;
    let COUNTER=COUNTER+1;
    let j=1673-$i ;
    head --lines +$i $TMP_FILE  | tail --lines 1 >> $FILE
    more $FILE

    echo $j ; 
    date -d "$j days ago"; 
    echo GIT_AUTHOR_DATE=\"`date -d "$j days ago"`\" GIT_COMMITTER_DATE=\"`date -d "$j days ago"`\"  git commit -m 'add';

done 