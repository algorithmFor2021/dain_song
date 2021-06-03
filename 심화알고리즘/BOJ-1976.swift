// 부모 노드를 찾는 함수
func getParent(_ parent: inout [Int], _ x: Int) -> Int {
    if parent[x] == x { return x }
    parent[x] = getParent(&parent, parent[x])
    return parent[x]
}

// 두 부모 노드를 합치는 함수
func unionParent(_ parent: inout [Int], _ a: Int, _ b: Int) {
    let a = getParent(&parent, a)
    let b = getParent(&parent, b)
    // 일반적으로 더 작은 값으로 합친다.
    if a < b {
        parent[b] = a
    } else {
        parent[a] = b
    }
}

// 같은 부모를 가지는지 확인 (같은 그룹에 속해있는지)
func findParent(_ parent: inout [Int], _ a: Int, _ b: Int) -> Int {
    let a = getParent(&parent, a)
    let b = getParent(&parent, b)
    return a == b ? 1 : 0
}

func BOJ_1976() {
    // 이 여행 경로가 가능한 것인지? -> 경로들이 전부 연결되어 있으면 YES, 중간에 연결이 안되면 NO
    let N = Int(readLine()!)!
    let M = Int(readLine()!)!
    var parent: [Int] = Array(0...N)
    for i in 1...N {
        let line = readLine()!.split(separator: " ").map{Int(String($0))!}
        for j in i...N {
            if line[j-1] == 1 {
                // 도시 i 와 j 를 연결한다. -> 노드 i, j의 부모를 합친다.
                unionParent(&parent, i, j)
            }
        }
    }
    // 주어진 여행 계획의 도시 순서대로 연결되어 있는지 확인한다.
    let plan = readLine()!.split(separator: " ").map{Int(String($0))!}
    for i in 0..<M-1 {
        if findParent(&parent, plan[i], plan[i+1]) == 0 {
            print("NO")
            return
        }
    }
    print("YES")
}
//BOJ_1976()