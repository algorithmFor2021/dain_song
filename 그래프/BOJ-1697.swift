// BOJ 1697 숨바꼭질 그래프

let NK = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NK[0], K = NK[1]
let MAX = 100001
var time = Array(repeating: 0, count: MAX)
var queue = [Int]()
queue.append(N)
while !queue.isEmpty {
    let x = queue.removeFirst()
    if x == K {
        break
    }
    for nx in [x-1, x+1, x*2] {
        if nx >= 0 && nx < MAX && time[nx] == 0 {
            time[nx] = time[x] + 1
            queue.append(nx)
        }
    }
}
print(time[K])