//
//  main.swift
//  Algorithm
//
//  Created by Dain Song on 2021/05/28.
//

func DFS(prev: Int, curr: Int, graph: [[Int]], visited: inout [Bool]) -> Bool {
    
    visited[curr] = true // 방문처리
    
    for next in graph[curr] {
        // 다음과 이전이 같은 경우, 같은 경로를 뜻하므로 무시
        if next == prev {
            continue
        }
        // next != prev, 이미 방문한 경우 사이클이 생기므로 트리가 아님
        if visited[next] {
            return false
        }
        // next != prev, 사이클이 없는 경우 DFS 수행
        // DFS 수행 도중 사이클이 생기면 false가 반환됨 -> 재귀적으로 false 반환
        if !DFS(prev: curr, curr: next, graph: graph, visited: &visited) {
            return false
        }
    }
    // DFS 수행 도중 사이클이 생기지 않으면 true 반환.
    return true
}

func BOJ_4803() {
    var i = 0
    while true {
        let line = readLine()!.split(separator: " ").map({Int($0)!})
        let n = line[0], m = line[1]
        if n == 0 && m == 0 { break }
        i += 1

        // 그래프와 방문처리 배열 초기화 및 데이터 입력 처리
        var graph: [[Int]] = Array(repeating: Array<Int>(), count: n+1)
        var visited: [Bool] = Array(repeating: false, count: n+1)
        for _ in 0..<m {
            let line = readLine()!.split(separator: " ").map({Int($0)!})
            graph[line[0]].append(line[1])
            graph[line[1]].append(line[0])
        }
        
        var tree = 0 // 트리의 개수
        for node in 1...n {
            if !visited[node] {
                // 해당 노드를 방문하지 않은 경우에만 DFS 수행
                if DFS(prev: 0, curr: node, graph: graph, visited: &visited) {
                    tree += 1 // 사이클이 생기지 않은 경우 트리의 개수 증가
                }
            }
        }
        if tree == 0 {
            print("Case \(i): No trees.")
        } else if tree == 1 {
            print("Case \(i): There is one tree.")
        } else{
            print("Case \(i): A forest of \(tree) trees.")
        }
    }
}

BOJ_4803()


/* Input
6 3
1 2
2 3
3 4
6 5
1 2
2 3
3 4
4 5
5 6
6 6
1 2
2 3
1 3
4 5
5 6
6 4
0 0
*/

/* Output
Case 1: A forest of 3 trees.
Case 2: There is one tree.
Case 3: No trees.
 */
