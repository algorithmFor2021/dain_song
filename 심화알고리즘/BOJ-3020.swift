func BOJ_3020() {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = line[0], H = line[1]
    var hurdles = Array(repeating: 0, count: H) // 높이마다 장애물 개수를 센다
    for i in 1...N {
        let h = Int(readLine()!)!
        if i % 2 == 1 {
            // 홀수번째는 석순, 아래서부터 h까지 장애물, h+1 지점에서 장애물에 부딪히지 않음
            hurdles[h] -= 1
        } else {
            // 짝수번째는 종유석, 위에서부터 h만큼 장애물, H-h+1 지점부터 장애물에 부딪힘
            hurdles[H-h] += 1
        }
    }

    // 누적합 계산하기
    for h in 1..<H {
        hurdles[h] += hurdles[h-1]
    }
    
    var minValue = hurdles[0]
    var count = 1
    for h in 1..<H {
        if hurdles[h] < minValue {
            count = 1
            minValue = hurdles[h]
        } else if hurdles[h] == minValue {
            count += 1
        }
    }
    print(minValue + (N/2), count)
}
BOJ_3020()