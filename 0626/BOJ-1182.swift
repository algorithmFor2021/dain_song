// BOJ-1182 부분수열의합
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], S = input[1]
let series = readLine()!.split(separator: " ").map{Int(String($0))!}

func findNumber(i: Int, sum: Int) -> Int {

    if i > series.count {
        return 0
    }

    var count = 0
    if sum == S {
        count += 1
    }
    for index in i+1..<series.count {
        count += findNumber(i: index, sum: sum + series[index])
    }
    return count
}

var count = 0
for i in 0..<N {
    count += findNumber(i: i, sum: series[i])
}
print(count)