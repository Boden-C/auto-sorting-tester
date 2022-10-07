# Automatic Sorting Tester
This script would test all 360 runs and output to a .csv file to be downloaded and imported

## If you HAVEN'T started at all yet, copy and paste this code into your Projects directory:
```
mkdir BubbleSort
mkdir InsertionSort
mkdir SelectionSort
cd BubbleSort
cp ~/Merlin/M1352-10\ \(01\)\ Bubble\ Sort/C101\ Bubble\ Sort\ \[Swift\]/main.swift main.swift
swift-init
cd ../InsertionSort
cp ~/Merlin/M2202-10\ \(01\)\ Insertion\ Sort/C100\ Insertion\ Sort\ \[Swift\]/main.swift main.swift
swift-init
cd ../SelectionSort
cp ~/Merlin/M2203-10\ \(01\)\ Selection\ Sort/C100\ Selection\ Sort\ \[Swift\]/main.swift main.swift
swift-init
cd ..
touch script.sh
echo -e '#!/bin/bash\ncat /usr/share/dict/words | sort > ordered.txt\ncat /usr/share/dict/words | sort -r > reverse-ordered.txt\ncat /usr/share/dict/words | sort -R > random.txt\nrm output.csv\nrm ~/www/Digital\ Portfolio/output.csv\n#echo -e 'Sort Name,Date and Time,Test Number,Git Branch,Git Hash,Command Line Executed,Text File,Count of Strings,Type of File,Execution Time (real, to nearest ms)' > output.csv\ncd BubbleSort\nbuild\ncd ../InsertionSort\nbuild\ncd ../SelectionSort\nbuild\ncd ..\nread -p "Enter FULL location of your own sorting repository (example: optimal-sort/a.out): " -r\nfor sort in $REPLY BubbleSort/.build/debug/Simple InsertionSort/.build/debug/Simple SelectionSort/.build/debug/Simple       \ndo\n    echo Going to $sort...\n    for order in ordered.txt reverse-ordered.txt random.txt\n    do\n        echo Trying $order... \n         for i in 0 1 2 3 4 5\n        do\n            let count=10**$i\n            echo testing $count numbers\n            for j in 1 2 3 4 5\n            do\n                cat $order | head -n $count > temp.txt\n                time=$( TIMEFORMAT=%R; { time $sort < temp.txt > /dev/null; } 2>&1)\n                date=$(date +"%D %T")\n                file="${order}10e${i}.txt" #fake file for requirement\n                echo -e "${sort},${date},${j},main,ab2375e83d83e7f873,time ${sort} < ${file} > /dev/null,${file},${count},${order},${time}" >> output.csv       \n            done\n        done\n    done\ndone\nrm temp.txt\ncp output.csv ~/www/Digital\ Portfolio/output.csv\nchmod a+rx -R ~/www/Digital\ Portfolio\necho DONE - open output.csv, or go to your Digital Portfolio/output.csv to download the file       \necho Change the branch, hash, command, and file name to your liking.' > script.sh
chmod u+x script.sh
```

## If you have started and all you need is the testing script, copy and paste this into your Projects directory OR copy/download the script.sh above:
```
touch script.sh
echo -e '#!/bin/bash\ncat /usr/share/dict/words | sort > ordered.txt\ncat /usr/share/dict/words | sort -r > reverse-ordered.txt\ncat /usr/share/dict/words | sort -R > random.txt\nrm output.csv\nrm ~/www/Digital\ Portfolio/output.csv\n#echo -e 'Sort Name,Date and Time,Test Number,Git Branch,Git Hash,Command Line Executed,Text File,Count of Strings,Type of File,Execution Time (real, to nearest ms)' > output.csv\ncd BubbleSort\nbuild\ncd ../InsertionSort\nbuild\ncd ../SelectionSort\nbuild\ncd ..\nread -p "Enter FULL location of your own sorting repository (example: optimal-sort/a.out): " -r\nfor sort in $REPLY BubbleSort/.build/debug/Simple InsertionSort/.build/debug/Simple SelectionSort/.build/debug/Simple       \ndo\n    echo Going to $sort...\n    for order in ordered.txt reverse-ordered.txt random.txt\n    do\n        echo Trying $order... \n         for i in 0 1 2 3 4 5\n        do\n            let count=10**$i\n            echo testing $count numbers\n            for j in 1 2 3 4 5\n            do\n                cat $order | head -n $count > temp.txt\n                time=$( TIMEFORMAT=%R; { time $sort < temp.txt > /dev/null; } 2>&1)\n                date=$(date +"%D %T")\n                file="${order}10e${i}.txt" #fake file for requirement\n                echo -e "${sort},${date},${j},main,ab2375e83d83e7f873,time ${sort} < ${file} > /dev/null,${file},${count},${order},${time}" >> output.csv       \n            done\n        done\n    done\ndone\nrm temp.txt\ncp output.csv ~/www/Digital\ Portfolio/output.csv\nchmod a+rx -R ~/www/Digital\ Portfolio\necho DONE - open output.csv, or go to your Digital Portfolio/output.csv to download the file       \necho Change the branch, hash, command, and file name to your liking.' > script.sh
chmod u+x script.sh
```
Once the commands stop executing, edit all three files and change the standard input/output and comparing strings. run ./script.sh after you finish.
NOTE: Swift default compare cares about case and diacritics, use a compare that fixes that like this from Foundation:
`stringA.compare(stringB, options: [.caseInsensitive, .diacriticInsensitive]) == .orderedSame`

It will ask you for your own optimal sort project. This is for if you want to include this in the test. 
If you want to test it, you must input the location of the EXECUTABLE file, which depends on the language. 2 most common ones are:
Swift: `directory-name/.build/debug/Simple`
C++ `directory-name/a.out`
If you don't want to test it, then you can input any fake name. The test would fail, and you can remove this in the spreadsheet afterwards.

Edit the code around in script.sh to choose what files you want to be runned by the code.

## After editing the files, run .`/script.sh` and wait. *this will take a while*

## It outputs to `output.csv`. It copies this file to your root of Digital Portfolio website. Go to `Digital%20Portfolio/output.csv` to download.

If you want to run this in the background, do
`./script.sh &`
after removing the prompt
