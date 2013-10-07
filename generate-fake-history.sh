#!\bin\bash
#a script to re-create a file, one line at a time, one day per line




for i in {0..1673}; 
do 
    echo $i;  
    cat  nzetc.csv | rev | sort | rev | head --lines $i >; 
    (( j = 1673 - $i )) ;
    echo $j ; 
    date -d "$j days ago"; 
    echo GIT_AUTHOR_DATE=\"`date -d "$j days ago"`\" GIT_COMMITTER_DATE=\"`date -d "$j days ago"`\"  git commit -m 'add'

done 