import Foundation;

func insertionSort(_ e:[String], _ f:[String]) -> [String] {
    guard (e.count > 0) else {
        return e;
    }
    var arr = e; var folded = f;
    for i in 1..<arr.count {
        var j = i;
        while (j > 0 && folded[j] < folded[j-1]) {
            arr.swapAt(j, j-1); folded.swapAt(j, j-1);
            j -= 1;
        }
    }
    return arr;
}
var arr = [String]();
var folded = [String]();
while let line = readLine() {
    arr.append(line);
    folded.append(line.lowercased().folding(options:.diacriticInsensitive,locale:Locale.current));
}
print(insertionSort(arr, folded));


