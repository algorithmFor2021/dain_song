// BOJ 2225 합분해 - DP

let line = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = line[0], K = line[1]
let maximum = 1000000000

// dp[k][n] = k개의 정수를 더해 n을 만들 수 있는 개수
var dp = Array(repeating: Array(repeating: 0, count: N+1), count: K+1)
for n in 0...N {
    dp[1][n] = 1 // 1개로 n을 만드는 경우는 1개
}
for k in 0...K {
    dp[k][0] = 1 // k개로 0을 만드는 경우는 1개
}

for k in 1...K {
    for n in 1...N {
        dp[k][n] = (dp[k-1][n] + dp[k][n-1]) % maximum
    }
}

print(dp[K][N])