// BOJ-1806 부분합
func BOJ_1806() -> Int {
    let NS = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = NS[0], S = NS[1]
    let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    if numbers.reduce(0, +) < S {
        return 0
    }
    
    for number in numbers {
        if number >= S {
            return 1
        }
    }

    var start = 0
    var end = 1
    var sum = numbers[start]
    var minLength = 100001
    while start < end && start >= 0 && end <= N {
        if sum < S && end < N {
            sum += numbers[end]
            end += 1
        } else {
            sum -= numbers[start]
            start += 1
        }
        if sum >= S {
            let length = end - start
            if minLength > length {
                minLength = length
            }
            //print(start, end, sum, length)
        }
    }
    return minLength
}
print(BOJ_1806())