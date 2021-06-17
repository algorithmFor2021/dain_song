func BOJ_1520() {
    
    var N = 0, M = 0
    var graph = [[Int]]()
    var dp = [[Int]]()
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    func dfs(_ y: Int, _ x: Int) -> Int {
        
        if y == N-1 && x == M-1 {
            return 1
        }
        
        if dp[y][x] != -1 {
            return dp[y][x]
        }
        
        dp[y][x] = 0 // 방문처리 겸 초기화
        for i in 0...3 {
            let nx = x + dx[i], ny = y + dy[i]
            if ny >= 0 && ny < N && nx >= 0 && nx < M {
                if graph[ny][nx] < graph[y][x] {
                    dp[y][x] += dfs(ny, nx)
                }
            }
        }
        return dp[y][x]
    }
    
    let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
    N = NM[0]
    M = NM[1]
    for _ in 1...N {
        graph.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    // dp[y][x] = graph[y][x] ~ graph[n-1][m-1] 까지의 경로의 개수
    dp = Array(repeating: Array(repeating: 0, count: M), count: N)
    print(dfs(0, 0))
}
//BOJ_1520()


/*
 4 5
 50 45 37 32 30
 35 50 40 20 25
 30 30 25 17 28
 27 24 22 15 10
 
 [3, 2, 2, 2, 1]
 [1, -1, -1, 1, 1]
 [1, -1, -1, 1, -1]
 [1, 1, 1, 1, -1]
 */