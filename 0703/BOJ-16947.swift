func BOJ_16947() {
    // graph[i] = i 번째 노드와 연결된 노드들의 배열 (양방향 간선)
    let N = Int(readLine()!)!
    var graph = Array(repeating: [Int](), count: N+1)
    for _ in 1...N {
        let edge = readLine()!.split(separator: " ").map{Int(String($0))!}
        let a = edge[0], b = edge[1]
        graph[a].append(b)
        graph[b].append(a)
    }
        
    var check = Array(repeating: 0, count: N+1)
    _ = checkCycle(1, 0) // DFS
    var dist = Array(repeating: 0, count: N+1)
    calcDistance() // BFS
    print(dist[1...N].map{String($0)}.joined(separator: " "))
    
    func checkCycle(_ current: Int, _ prev: Int) -> Int {
        if check[current] == 1 {
            return current // 이미 방문한 노드에 재방문 (순환되는 경우 노드값 반환)
        }
        check[current] = 1 // 방문체크

        for next in graph[current] {
            if next == prev { continue } // 사이클이 아닌, 갔다 돌아온 경우 // a -> b -> a
            let result = checkCycle(next, current) // -1 or node
            // result == -1 :: 순환선 바깥으로 지선을 의미
            if result >= 0 { // 순환선 내부 노선을 의미
                check[current] = 2 // 순환선 노선임을 체크
                if current == result { return -1 } // 노드가 연결되지 않은경우 (0번?)
                else { return result } // 순환된 경우 노드를 반환한다.
            }
        }
        return -1 // next != prev 외 다른 노드가 없다면 -1 를 반환. 순환선 밖인 경우
    }
    
    func calcDistance() {
        var queue = [Int]()
        for i in 1...N {
            if check[i] == 2 {
                // 순환선 내부에 연결된 노드, 순환선과의 거리는 0이다.
                dist[i] = 0
                queue.append(i)
            } else {
                // 순환선 외부에 연결된 노드, 순환선과의 거리를 계산해야한다.
                dist[i] = -1
            }
        }
        while !queue.isEmpty {
            let a = queue.removeFirst()
            for b in graph[a] {
                if dist[b] == -1 {
                    queue.append(b)
                    dist[b] = dist[a] + 1
                }
            }
        }
    }
}