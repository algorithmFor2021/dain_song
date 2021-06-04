struct BOJ_2610 {
    
    static let INF = Int(1e9)
    
    static func DFS(graph: inout [[Int]], groups: inout [Int], n: Int, groupNum: Int) {
        guard groups[n] == 0 else { return }
        groups[n] = groupNum
        
        for i in 1...graph.count-1 {
            if graph[n][i] == 0 || graph[n][i] == INF {
                continue
            }
            DFS(graph: &graph, groups: &groups, n: i, groupNum: groupNum)
        }
    }
    
    static func floydWarshall(N: Int, graph: inout [[Int]]) {
        for k in 1...N {
            for a in 1...N {
                for b in 1...N {
                    graph[a][b] = min(graph[a][b], graph[a][k] + graph[k][b])
                }
            }
        }
    }

    static func run() {
        let N = Int(readLine()!)! // 회의에 참석하는 사람의 수, N <= 100
        let M = Int(readLine()!)! // 서로 알고 있는 관계의 수
        // a->b 로 가는 최소비용
        var graph = Array(repeating: Array(repeating: INF, count: N+1), count: N+1)
        for i in 1...N {
            graph[i][i] = 0 // 자기자신으로 가는 비용 0
        }
        for _ in 0..<M {
            let line = readLine()!.split(separator: " ").map{Int(String($0))!}
            let a = line[0], b = line[1]
            graph[a][b] = 1
            graph[b][a] = 1
        }
        
        floydWarshall(N: N, graph: &graph) // 플루이드와샬로 최소 경로 계산

        // 묶인 노드끼리 그룹 나누기
        var groupNum = 0
        var groups = Array(repeating: 0, count: N+1)
        for i in 1...N {
            if groups[i] == 0 {
                groupNum += 1
                DFS(graph: &graph, groups: &groups, n: i, groupNum: groupNum)
            }
        }
        
        // 위원회 대표 구하기
        var representations = Array(repeating: 0, count: groupNum+1)
        var groupMinCost = Array(repeating: INF, count: groupNum+1)
        // i가 위원회 대표가 됐을 때, 최대비용를 계산 -> 최대비용이 최소가 되는 i 를 대표로 지정
        for i in 1...N {
            let group = groups[i]
            var maxCost = 0
            // i 가 대표일 때 의사전달시간 중 최댓값을 찾기
            for j in 1...N {
                if graph[i][j] != INF {
                    maxCost = max(maxCost, graph[i][j])
                }
            }
            // 최대값인 의사전달시간이 그룹에서의 최소값인지 비교
            if maxCost < groupMinCost[group] {
                groupMinCost[group] = maxCost
                representations[group] = i
            }
        }
        
        print(groupNum) // 구성되는 위원회의 수
        for r in representations[1...groupNum] {
            print(r)
        }
    }
}
//BOJ_2610.run()