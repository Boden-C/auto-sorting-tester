
import Foundation;

func bubbleSort(_ e:[String], _ f:[String]) -> [String] {
    guard (e.count > 1) else {
        return e;
    }
    var arr = e;
    var folded = f;
    for i in 0..<arr.count {
        var isSorted = true;
        for j in 1..<arr.count-1-i { //i number of largest numbers is already sorted at the end, no need to go beyond count-1-i
            if folded[j] < folded[j-1] {
                arr.swapAt(j, j-1);
                folded.swapAt(j, j-1)
                isSorted = false;
            }
        }
        if (isSorted) {
            break;
        }
     }
    return arr;
}
var arr = [String]();
var folded = [String]();
while let line = readLine() {
    arr.append(line)
    folded.append(line.lowercased().folding(options:.diacriticInsensitive,locale:Locale.current));
}
print(bubbleSort(arr, folded));

/*
func bubbleSort(unsortedArr: [String], endIndex: Int) {
    var unsortedArr = unsortedArr
    var endIndex = endIndex

    for upper in 0 ..< unsortedArr.count {
        if upper != 0 {
            endIndex -= 1
        }

        for index in 1 ..< endIndex {
            if lowerList[index] < lowerList[index - 1] {
                unsortedArr.swapAt(index, index-1)
                lowerList.swapAt(index, index-1)
            }
        }
    }

    for i in 0 ..< unsortedArr.count {
        print(unsortedArr[i])
    }
}



var unsortedArr = [String]()
var lowerList = [String]()

while let input = readLine() {
    unsortedArr.append(input)
    lowerList.append((input.lowercased()).folding(options: .diacriticInsensitive, locale: Locale.current))
}

bubbleSort(unsortedArr: unsortedArr, endIndex: unsortedArr.count)

*/
