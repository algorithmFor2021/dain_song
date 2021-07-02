//
//  BOJ_11060.swift
//  Algorithm
//
//  Created by Dain Song on 2021/07/02.
//

import Foundation

func BOJ_11060() {
    let N = Int(readLine()!)!
    let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
    let maxValue = 1001
    var dp = Array(repeating: maxValue, count: N)
    dp[0] = 0
    for (i, number) in numbers.enumerated() {
        if number == 0 { continue }
        for j in 1...number {
            let next = i + j
            if next < N {
                dp[next] = min(dp[next], dp[i] + 1)
            }
        }
    }
    print(dp[N-1] == maxValue ? -1 : dp[N-1])
}
//BOJ_11060()
