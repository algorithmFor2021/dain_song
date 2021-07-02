//
//  BOJ_16197.swift
//  Algorithm
//
//  Created by Dain Song on 2021/07/01.
//

import Foundation

func BOJ_16197() {
    
    let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = NM[0], M = NM[1]
    var graph = Array(repeating: Array(repeating: false, count: 22), count: 22) // 벽 true
    var times = Array(repeating: Array(repeating: Array(repeating: Array(repeating: 0, count: 22), count: 22), count:22), count: 22) // [n][m][n][m] 식으로 방문처리하기
    
    typealias Coord = (y: Int, x: Int)
    var coins = [Coord]()

    for i in 1...N {
        let line = readLine()!
        for (j, element) in line.enumerated() {
            if element == "#" {
                graph[i][j+1] = true
            } else if element == "o" {
                coins.append((i, j+1))
            }
        }
    }

    if N == 1 && M == 1 {
        print(-1)
        return
    }
        
    bfs()
    
    func bfs() {
        // up, down, left, right
        let dy = [-1, 1, 0, 0]
        let dx = [0, 0, -1, 1]
        var queue: [[Coord]] = [coins]
        while !queue.isEmpty {
            let c = queue.removeFirst()
            let c1 = c[0], c2 = c[1]
            let currentTime = times[c1.y][c1.x][c2.y][c2.x]
            if currentTime > 10 { break }
            
            // 하나만 떨어진 경우 "정답"
            // BFS 에서는 가장먼저 나온 경우가 가장 짧은 거리이므로 바로 return
            if (!isOut(c1) && isOut(c2)) || (isOut(c1) && !isOut(c2)) {
                print(currentTime)
                return
            }
            
            for i in 0..<4 {
                var next1 = Coord(c1.y + dy[i], c1.x + dx[i])
                var next2 = Coord(c2.y + dy[i], c2.x + dx[i])                
                if isOut(next1) && isOut(next2) { continue } // 둘 다 떨어진 경우 무시
                if isWall(next1) && isWall(next2) { continue } // 둘 다 벽인 경우 무시
                
                // 하나만 벽인 경우 좌표를 기존값으로 변경
                if isWall(next1) {
                    next1 = c1
                } else if isWall(next2) {
                    next2 = c2
                }
                
                // 이미 방문한 경우면 시간이 갱신되어있음
                if times[next1.y][next1.x][next2.y][next2.x] > 0 { continue }
                
                // Queue 에 추가 & 시간계산
                queue.append([next1, next2])
                times[next1.y][next1.x][next2.y][next2.x] = currentTime + 1
            }
        }
        print(-1)
    }
    
    func isOut(_ coin: Coord) -> Bool {
        if coin.y < 1 || coin.y > N || coin.x < 1 || coin.x > M {
            return true
        }
        return false
    }
    
    func isWall(_ coin: Coord) -> Bool {
        return graph[coin.y][coin.x]
    }
}
//BOJ_16197()
