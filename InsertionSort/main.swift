func getStandardIn() -> [String] {
    var arr = [String]();
    while let line = readLine() {
        arr.append(line);
    }
    return arr;
}

func insertionSort(_ e:[String]) -> [String] {
    guard (e.count > 0) else {
        return e;
    }
    var arr = e; var totalSwaps = 0;
    for i in 1..<arr.count {
        var j = i; var swaps = 0;
        while (j > 0 && arr[j] < arr[j-1]) {
            arr.swapAt(j, j-1);
            swaps += 1; j -= 1;
        }
        totalSwaps += swaps;
    }
    return arr;
}

print(insertionSort(getStandardIn()));


