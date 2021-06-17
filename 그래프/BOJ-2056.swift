// BOJ-2056 작업

let N = Int(readLine()!)!
var graph = Array(repeating: [Int](), count: N+1)
var indegree = Array(repeating: 0, count: N+1) // 진입 차수
var time = Array(repeating: 0, count: N+1) // 작업 시간

for i in 1...N {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    time[i] = line[0]
    for j in 0..<line[1] {
        let preNode = line[2+j]
        graph[preNode].append(i)
        indegree[i] += 1
    }
}

//var queue = DoubleStackQueue()
var queue = [Int]()
for i in 1...N {
    if indegree[i] == 0 {
        queue.append(i)
    }
}

var idx = 0
var finishTime = Array(repeating: 0, count: N+1)
while idx < queue.count {
    let node = queue[idx]
    finishTime[node] += time[node]
    idx += 1
    for nextNode in graph[node] {
        indegree[nextNode] -= 1
        finishTime[nextNode] = max(finishTime[nextNode], finishTime[node])
        if indegree[nextNode] == 0 {
            queue.append(nextNode)
        }
    }
}
print(finishTime.max()!)