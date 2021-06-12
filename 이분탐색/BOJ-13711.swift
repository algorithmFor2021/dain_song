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

func BOJ_13711() {
    
    let N = Int(readLine()!)!
    let array1 = readLine()!.split(separator: " ").map{Int(String($0))!}
    let array2 = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    // array2 의 인덱스를 array1 기준으로 정렬
    var temp = Array(repeating: 0, count: array2.max()!)
    for i in 0..<N {
        let x = array2[i]
        temp[x - 1] = i
    }
    
    var index = Array(repeating: 0, count: N)
    for i in 0..<N {
        index[i] = temp[array1[i] - 1]
    }
    
    // index 배열에서 가장 긴 증가하는 부분 수열을 찾기
    var series = [-1]
    for i in index {
        if i > series.last! {
            series.append(i)
        } else {
            series[bisect_left(series, i)] = i
        }
    }
    print(series.count - 1)
}
BOJ_13711()