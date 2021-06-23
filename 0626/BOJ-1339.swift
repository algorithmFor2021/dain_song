// BOJ-1339.swift 단어 수학 - 그리디
import Foundation

let N = Int(readLine()!)!
var charWeights = [Character:Decimal]()

for _ in 1...N {
    let word = readLine()!
    var weight = pow(10, word.count-1)
    for char in word {
        if charWeights.keys.contains(char) {
            charWeights[char]! += weight
        } else {
            charWeights[char] = weight
        }
        weight /= 10
    }
}

var sum: Decimal = 0
var number: Decimal = 9

for (_, value) in charWeights.sorted(by: {$0.1 > $1.1}) {
    // value 기준 내림차순 정렬
    sum += number * value
    number -= 1
}
print(sum)