import Foundation;

func getStandardIn() -> [String] {
    var arr = [String]();
    while let line = readLine() {
        arr.append(line);
    }
    return arr;
}

func selectionSort(_ e:[String]) -> [String] {
    var arr = e; var totalSwaps = 0;
    for i in 0..<arr.count-1 {
        var swaps = 0;
        var minIndex = i;
        for j in i+1..<arr.count {
            if (arr[minIndex].compare(arr[j], options: [.caseInsensitive, .diacriticInsensitive]) == .orderedDescending) {
                minIndex = j;
            }
        }
        arr.swapAt(i, minIndex);
        swaps += 1; totalSwaps += swaps;
    }
    return arr;
}

print(selectionSort(getStandardIn()));
