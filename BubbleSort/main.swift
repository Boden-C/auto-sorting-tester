import Foundation;

func getStandardIn() -> [String] {
    var arr = [String]();
    while let line = readLine() {
        arr.append(line);
    }
    return arr;
}

func bubbleSort(_ e:[String]) -> [String] {
    guard (e.count > 1) else {
        print(e);
        return e;
    }
    var totalSwap = 0
    var totalPass = 0
    var sorted = e
    var currentSwap = 0
    repeat {
        currentSwap = 0
        for index in 1..<sorted.count {
            if sorted[index].compare(sorted[index-1], options:[.caseInsensitive, .diacriticInsensitive]) == .orderedAscending {
                sorted.swapAt(index-1, index)
                currentSwap += 1
                totalSwap += 1
            }
        }
        totalPass += 1
    } while currentSwap > 0
    return sorted;
}

print(bubbleSort(getStandardIn()));

