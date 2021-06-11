func BOJ_2437() {
    
    let N = Int(readLine()!)!
    var weights = readLine()!.split(separator: " ").map{Int(String($0))!}
    weights.sort()
    
    guard var minWeight = weights.first, minWeight == 1  else {
        print(1) // 가장 작은 추가 1보다 큰 경우, 1을 계산하지 못하므로 예외처리
        return
    }
    for i in 1..<N {
        // 현재까지 가능한 최소무게와 1만큼 차이나야 다음 무게를 측정할 수 있다.
        if weights[i] > minWeight + 1 {
            break
        }
        minWeight += weights[i] // 현재무게까지 추가했을 때 가능한 최소무게를 잰다.
    }
    // 다음 무게와 1넘게 차이나는 경우, 최소 무게 + 1 부터 측정할 수 없다.
    print(minWeight + 1)
}
//BOJ_2437()