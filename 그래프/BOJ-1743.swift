//
//  main.swift
//  Algorithm
//
//  Created by Dain Song on 2021/05/26.
//

import Foundation

// BOJ-1743 음식물피하기

func dfs(graph: inout [[Int]], y: Int, x : Int, label: Int) -> Int {
    // 그래프 범위를 벗어난 경우 종료
    if y < 0 || y >= graph.count || x < 0 || x >= graph[0].count {
        return 0
    }
    
    // 이미 라벨링이 되어있거나 0인 경우 종료
    if graph[y][x] != 1 {
        return 0
    }
    
    graph[y][x] = label // 라벨링
    
    // 상하좌우로 연결된 영역을 방문하며 개수를 센다.
    var count = 1
    count += dfs(graph: &graph, y: y-1, x: x, label: label)
    count += dfs(graph: &graph, y: y+1, x: x, label: label)
    count += dfs(graph: &graph, y: y, x: x-1, label: label)
    count += dfs(graph: &graph, y: y, x: x+1, label: label)
    return count
}

// Input
let line = readLine()!.split(separator: " ").map{Int($0)!}
var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: line[1]), count: line[0])
for _ in 0..<line[2] {
    let coord = readLine()!.split(separator: " ").map{Int($0)!}
    graph[coord[0]-1][coord[1]-1] = 1
}

// Output
var label = 2
var max_size = 0
for y in 0..<line[0] {
    for x in 0..<line[1] {
        if graph[y][x] != 1 {
            continue
        }
        let size = dfs(graph: &graph, y: y, x: x, label: label)
        max_size = max(size, max_size)
        if size > 0 {
            label += 1
        }
    }
}
print(max_size)
