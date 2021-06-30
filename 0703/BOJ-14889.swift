//
//  BOJ-14889.swift
//  Algorithm
//
//  Created by Dain Song on 2021/07/01.
//

import Foundation

func BOJ_14889() {
    
    let N = Int(readLine()!)!
    var minDiff = Int.max
    var stats = [[Int]]()
    for _ in 1...N {
        stats.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }

    func dfs(_ N: Int, _ i: Int, _ start: [Int], _ link: [Int]) {

        if start.count >= N/2 && link.count >= N/2 {
            minDiff = min(minDiff, diff(teams: [start, link]))
            return
        }

        if start.count < N/2 {
            dfs(N, i+1, start + [i], link)
        }
        
        if link.count < N/2 {
            dfs(N, i+1, start, link + [i])
        }
    }

    func diff(teams: [[Int]]) -> Int {
        let startTeam = teams[0], linkTeam = teams[1]
        var startStats = 0
        for i in startTeam {
            for j in startTeam {
                startStats += stats[i][j]
            }
        }
        var linkStats = 0
        for i in linkTeam {
            for j in linkTeam {
                linkStats += stats[i][j]
            }
        }
        return abs(startStats - linkStats)
    }

    dfs(N, 0, [Int](), [Int]())
    print(minDiff)
}
