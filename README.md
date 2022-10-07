# Automatic Sorting Tester
This script would tests all 360 runs and output to a .csv file to be downloaded and imported

If you HAVEN'T started at all yet, copy and paste this code into your Projects directory:
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
echo -e '#!/bin/bash\ncat /usr/share/dict/words | sort > ordered.txt\ncat /usr/share/dict/words | sort -r > reverse-ordered.txt\ncat /usr/share/dict/words | sort -R > random.txt\nrm output.csv\nrm ~/www/Digital\ Portfolio/output.csv\ncd BubbleSort\nbuild\ncd ../InsertionSort\nbuild\ncd ../SelectionSort\nbuild\ncd ..\nread -p "Enter FULL location of your own sorting repository (example: optimal-sort/a.out): " -r\nfor sort in $REPLY BubbleSort/.build/debug/Simple InsertionSort/.build/debug/Simple SelectionSort/.build/debug/Simple       \ndo\n    echo Going to $sort...\n    for order in ordered.txt reverse-ordered.txt random.txt\n    do\n        echo Trying $order... \n         for i in 0 1 2 3 4 5\n        do\n            let count=10**$i\n            for j in 1 2 3 4 5\n            do\n                cat $order | head -n $count > temp.txt\n                time=$( TIMEFORMAT=%R; { time $sort < temp.txt > /dev/null; } 2>&1)\n                date=$(date +"%D %T")\n                echo $sort,$date,$j,main,ab2375e83d83e7f873,time swift main.swift,$order,$count,$order,$time >> output.csv       \n            done\n        done\n    done\ndone\nrm temp.txt\ncp output.csv ~/www/Digital\ Portfolio/output.csv\nchmod a+rx -R ~/www/Digital\ Portfolio\necho DONE - open output.csv, or go to your Digital Portfolio/output.csv to download the file       \necho Change the branch, hash, command, and file name to your liking.' > script.sh
chmod u+x script.sh
```

If you have started and all you need is the testing script, copy and paste this into your Projects directory OR copy/download the script.sh above:
```
touch script.sh
echo -e '#!/bin/bash\ncat /usr/share/dict/words | sort > ordered.txt\ncat /usr/share/dict/words | sort -r > reverse-ordered.txt\ncat /usr/share/dict/words | sort -R > random.txt\nrm output.csv\nrm ~/www/Digital\ Portfolio/output.csv\ncd BubbleSort\nbuild\ncd ../InsertionSort\nbuild\ncd ../SelectionSort\nbuild\ncd ..\nread -p "Enter FULL location of your own sorting repository (example: optimal-sort/a.out): " -r\nfor sort in $REPLY BubbleSort/.build/debug/Simple InsertionSort/.build/debug/Simple SelectionSort/.build/debug/Simple       \ndo\n    echo Going to $sort...\n    for order in ordered.txt reverse-ordered.txt random.txt\n    do\n        echo Trying $order... \n         for i in 0 1 2 3 4 5\n        do\n            let count=10**$i\n            for j in 1 2 3 4 5\n            do\n                cat $order | head -n $count > temp.txt\n                time=$( TIMEFORMAT=%R; { time $sort < temp.txt > /dev/null; } 2>&1)\n                date=$(date +"%D %T")\n                echo $sort,$date,$j,main,ab2375e83d83e7f873,time swift main.swift,$order,$count,$order,$time >> output.csv       \n            done\n        done\n    done\ndone\nrm temp.txt\ncp output.csv ~/www/Digital\ Portfolio/output.csv\nchmod a+rx -R ~/www/Digital\ Portfolio\necho DONE - open output.csv, or go to your Digital Portfolio/output.csv to download the file       \necho Change the branch, hash, command, and file name to your liking.' > script.sh
chmod u+x script.sh
```
