func BOJ_11660() {
    let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = NM[0], M = NM[1]
    var graph = [[Int]]()
    for _ in 1...N {
        let line = readLine()!.split(separator: " ").map{Int(String($0))!}
        graph.append(line)
    }
    // 부분합
    var sum = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)
    for y in 1...N {
        for x in 1...N {
            let current = graph[y-1][x-1]
            sum[y][x] = sum[y-1][x] + sum[y][x-1] - sum[y-1][x-1] + current
        }
    }
    // (y1,x1) ~ (y2,x2) 구간의 합
    for _ in 1...M {
        let line = readLine()!.split(separator: " ").map{Int(String($0))!}
        let y1 = line[0], x1 = line[1], y2 = line[2], x2 = line[3]
        print(sum[y2][x2] - sum[y2][x1-1] - sum[y1-1][x2] + sum[y1-1][x1-1])
    }
}
//BOJ_11660()