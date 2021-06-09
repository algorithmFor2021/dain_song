func bisect_left(_ array: [Int], _ target: Int) -> Int {
    var start = 0, end = array.count - 1
    while start <= end {
        let mid = (start + end) / 2
        if array[mid] < target {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    return start
}

func BOJ_12738() {

    let _ = Int(readLine()!)!
    let array = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    var series: [Int] = [-1000000000] // |Ai| <= 1,000,000,000
    for newNum in array {
        let lastNum = series.last!
        if lastNum < newNum {
            // 부분수열의 마지막(최대값)보다 크면 부분수열에 추가한다.
            series.append(newNum)
        } else {
            // 부분수열의 마지막(최대값)보다 작으면 기존 부분수열의 위치의 값을 덮어쓴다.
            let index = bisect_left(series, newNum)
            series[index] = newNum
        }
    }
    print(series)
    print(series.count - 1)
}
//BOJ_12738()