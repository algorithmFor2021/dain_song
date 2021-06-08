func switchLamps(_ lamps: [[Int]], _ N: Int, _ M: Int, _ K: Int) -> Int {
    
    var answer = 0
    for n in 0..<N {
        var zeroCount = 0 // lamps[n] 에 0 이 몇 개 있는지 세기위함 => 스위치를 누를 열의 개수
        var sameRow = 0 // lamps[n] 과 같은 행이 몇 개 있는지 세기위함 => 켜져있는 행의 값
        for m in 0..<M {
            if lamps[n][m] == 0 {
                zeroCount += 1 // lamps[n] 의 0 개수를 카운트
            }
        }
        // lamps[n] 의 0 개수가 K 개 이하이고
        // 0 개수를 2로 나눈 나머지와 K 를 2로 나눈 나머지가 같아야함. (켜거나 끄거나 하나여야하므로)
        if zeroCount <= K && zeroCount % 2 == K % 2 {
            for k in n..<N {
                // 현재 행 이후의 행에 대해 같은 행의 개수를 센다.
                // => lamps[n] 과 함께 켜져있는 행의 개수가 됨.
                if lamps[n] == lamps[k] {
                    sameRow += 1
                }
            }
            answer = max(answer, sameRow) // 켜져있는 행의 최댓값을 갱신
        }
    }
    return answer
}

func BOJ_1034() {
    
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = line[0], M = line[1]
    
    var lamps = [[Int]]()
    for _ in 1...N {
        lamps.append(readLine()!.map{Int(String($0))!})
    }
    let K = Int(readLine()!)!
    print(switchLamps(lamps, N, M, K))
}