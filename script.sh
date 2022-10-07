#!/bin/bash
cat /usr/share/dict/words | sort > ordered.txt
cat /usr/share/dict/words | sort -r > reverse-ordered.txt
cat /usr/share/dict/words | sort -R > random.txt
rm output.csv
echo -e 'Sort Name,Date and Time,Test Number,Git Branch,Git Hash,Command Line Executed,Text File,Count of Strings,Type of File,Execution Time (real, to nearest ms)' > output.csv
rm ~/www/Digital\ Portfolio/output.csv
cd BubbleSort
build
cd ../InsertionSort
build
cd ../SelectionSort
build
cd ..
read -p "Enter FULL location of your own sorting repository (example: optimal-sort/a.out): " -r
for sort in $REPLY InsertionSort/.build/debug/Simple SelectionSort/.build/debug/Simple       
do
    echo Going to $sort...
    for order in ordered reverse-ordered random
    do
        echo Trying $order.txt ... 
     for i in 0 1 2 3 4 5
     do
         let count=10**$i
	 echo doing $count numbers
            for j in 1 2 3 4 5
            do
                cat $order.txt | head -n $count > temp.txt
                time=$( TIMEFORMAT=%R; { time $sort < temp.txt > /dev/null; } 2>&1)
                date=$(date +"%D %T")
		file="${order}10e${i}.txt" #fake file for requirement
                echo -e "${sort},${date},${j},main,ab2375e83d83e7f873,time ${sort} < ${file} > /dev/null,${file},${count},${order},${time}" >> output.csv
            done
        done
    done
done
rm temp.txt
cp output.csv ~/www/Digital\ Portfolio/output.csv
chmod a+rx -R ~/www/Digital\ Portfolio
echo DONE - open output.csv, or go to your Digital Portfolio/output.csv to download the file
echo Change the branch, hash, command, and file name to your liking.
