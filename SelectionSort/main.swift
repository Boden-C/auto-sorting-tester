import Foundation;

func selectionSort(_ e:[String], _ f:[String]) -> [String] {
    var arr = e; var folded = f;
    for i in 0..<arr.count-1 {
        var minIndex = i;
        for j in i+1..<arr.count {
            if (folded[minIndex] > folded[j]) {
                minIndex = j;
            }
        }
        folded.swapAt(i, minIndex)
        arr.swapAt(i, minIndex);
    }
    return arr;
}
var arr = [String]();
var folded = [String]();
while let line = readLine() {
    arr.append(line);
    folded.append(line.lowercased().folding(options:.diacriticInsensitive,locale:Locale.current));
}
print(selectionSort(arr, folded));
